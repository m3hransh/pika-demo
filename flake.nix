# file: flake.nix
{
  description = "Python application packaged using poetry2nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    poetry2nix.url = "github:nix-community/poetry2nix";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, poetry2nix, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # see https://github.com/nix-community/poetry2nix/tree/master#api for more functions and examples.
        pkgs = import nixpkgs { inherit system; config = { }; overlays = [ ]; };
        inherit (poetry2nix.lib.mkPoetry2Nix { inherit pkgs; }) mkPoetryApplication;
      in
      {
        packages = {
          myapp = mkPoetryApplication { projectDir = self; };
          default = self.packages.${system}.myapp;
        };

        # Shell for app dependencies.
        #
        #     nix develop
        #
        # Use this shell for developing your app.
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.poetry pkgs.rabbitmq-server ];
          inputsFrom = [ self.packages.${system}.myapp ];
          shellHook = ''
            mkdir -p ./rabbitmq_data/mnesia
            mkdir -p ./rabbitmq_data/log

            # Set environment variables to use the writable directories
            export RABBITMQ_MNESIA_BASE=$PWD/rabbitmq_data/mnesia
            export RABBITMQ_LOGS=$PWD/rabbitmq_data/log/rabbitmq.log

            # Optional: specify a custom configuration file path
            export RABBITMQ_CONFIG_FILE=$PWD/rabbitmq.conf

            # Start RabbitMQ in the background
            echo "Starting RabbitMQ with writable data directory..."
            rabbitmq-server -detached
            echo "RabbitMQ is now running in the background.";
          '';
          shellExit = ''
            echo "Stopping RabbitMQ server..."
            rabbitmqctl shutdown
          '';
        };

        # Shell for poetry.
        #
        #     nix develop .#poetry
        #
        # Use this shell for changes to pyproject.toml and poetry.lock.
        devShells.poetry = pkgs.mkShell {
          packages = [ pkgs.poetry ];
        };
      });
}


