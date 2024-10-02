# Pika Starter Using Nix

This a demo for using RabbitMQ using [Pika](https://pika.readthedocs.io/en/stable/) library. This project has been developed using nix for being self-contained without any
external dependencies except for nix.

## Getting Started with Development

### 1. Install Nix

First, you need to install Nix on your machine. Follow the instructions on the [Nix installation page](https://nixos.org/download.html) for your operating system.

### 2. Set Up the Development Environment

To set up your development environment, you have two options:

- **Option 1: Use `nix develop`**  
  This command automatically loads the shell with all the dependencies defined in the `flake.nix` file.

```bash
  $ nix develop
```

- Option 2: Install Direnv (Recommended for a Better Development Experience)
Direnv is a tool that automatically loads and unloads environment variables depending on the current directory. It works seamlessly with Nix to load your development environment.

Install Direnv by following the instructions here.
Allow Direnv to load the environment automatically:
bash
Copy code
$ direnv allow
Once set up, Direnv will automatically load the environment when you enter the project directory.

### 3. Trying out
The server autmatically will be started when you go to nix develop.
1. Validate that using `rabbitmqctl status`, otherwise use rabbitmq-server.

2. Run the Consumer using:
```sh
$ python src/receive.py
```
3. Run the Producer using:
```sh
$ python src/send.py
```

