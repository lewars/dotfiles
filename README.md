# My dotfiles

Dotfiles repo that is managed by Ansible.

A work in progress.
---

# My PyTorch Extended Docker Image

This project provides a Docker image based on the NVIDIA PyTorch container, extended with additional Python libraries.

## Prerequisites

* Docker installed and running.
* NVIDIA Container Toolkit installed and configured for GPU support (if using GPU).
* Task (optional, for simplified build and run commands).

## Usage

### Using Task (Recommended)

1.  **Install Task:** If you don't have Task installed, follow the instructions at [taskfile.dev](https://taskfile.dev/).
2.  **Clone the repository (or create the files):**
    * Ensure you have the `Dockerfile` and `Taskfile.yml` in the same directory.
3.  **Build the image:**

    ```bash
    task build
    ```

    You can specify a tag:

    ```bash
    task build IMAGE_TAG=my_tag
    ```

4.  **Run the container:**

    ```bash
    task run
    ```

    To run a specific tag:

    ```bash
    task run IMAGE_TAG=my_tag
    ```

5.  **Clean the image:**

    ```bash
    task clean
    ```

6.  **Rebuild the image:**

    ```bash
    task rebuild
    ```

7.  **Tag the image:**

    ```bash
    task tag new_tag=production
    ```

### Without Task

1.  **Build the image:**

    ```bash
    docker build -t my-pytorch-extended:latest .
    ```

    Or, with a specific tag:

    ```bash
    docker build -t my-pytorch-extended:my_tag .
    ```

2.  **Run the container:**

    ```bash
    docker run --gpus all -it my-pytorch-extended:latest /bin/bash
    ```

    Or, with a specific tag:

    ```bash
     docker run --gpus all -it my-pytorch-extended:my_tag /bin/bash
    ```

3.  **Remove the image:**

    ```bash
    docker rmi -f my-pytorch-extended:latest
    ```

    Or, with a specific tag:

    ```bash
    docker rmi -f my-pytorch-extended:my_tag
    ```

## Dockerfile

The `Dockerfile` is based on the NVIDIA PyTorch container and installs the following Python libraries:

* `pandas`
* `scikit-learn`
* `matplotlib`

You can customize the `Dockerfile` to install additional libraries or modify the base image.

## Taskfile.yml

The `Taskfile.yml` simplifies common Docker commands.

## Security Considerations

* Avoid embedding sensitive information in your Dockerfile or build process.
* Use Docker secrets for handling sensitive data at runtime.
* Be mindful of the build context and avoid including unnecessary files.

## Customization

* Modify the `Dockerfile` to add or remove Python libraries.
* Customize the `Taskfile.yml` to add or modify tasks.
* If you have application code, add a `COPY` command to the docker file.
* Add a `CMD` command to the docker file to run your application.
