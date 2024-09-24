# FastAPI Starter Using Nix

This is a starter repository for using Nix to manage dependencies for both development and deployment of a FastAPI project. The setup leverages `flake` to ensure reproducibility and consistency across environments.

## Why You Should Use Nix

Nix is a powerful tool and language that allows you to declaratively manage your development and deployment environments. By using Nix, you can ensure that your project's dependencies are defined in a way that guarantees consistency across different machines and setups. 

Some benefits of using Nix include:
- **Reproducibility**: Every environment is built exactly the same way, ensuring no "it works on my machine" issues.
- **Declarative Configuration**: Define your environment in a single file, making it easy to share and collaborate with others.
- **Isolated Environments**: Nix provides isolated development environments that prevent dependency conflicts.

There is much more to Nix, and if you're interested in learning more, you can explore the [official Nix documentation](https://nixos.org/manual/nix/stable/).

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

3. Run the Server
To run the FastAPI server, use the following command:

bash
Copy code
$ poetry run uvicorn rest_api:app --reload
The --reload flag is used for auto-reloading the server whenever code changes are detected, which is useful during development.

## Deployment
For deployment, you can leverage Nix's ability to create reproducible builds. This ensures that the environment on the deployment server matches the development environment exactly. Consult the Nix documentation and examples to tailor the deployment process to your needs.

This repository is designed to give you a head start with FastAPI and Nix. Feel free to customize it according to your project's requirements.
