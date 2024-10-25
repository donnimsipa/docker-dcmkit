# DICOM Networking, Imaging, and Networking Tools Docker Image

## Overview

This Docker image provides a customizable environment for DICOM and networking operations. It is based on **Debian stable-slim** and can be configured with different tools based on build arguments. These tools include **DCMTK** for DICOM operations, **GDCM** for additional imaging tools, and a suite of networking utilities.

The image is built with flexibility in mind, allowing users to toggle the inclusion of these tools at build time by setting build arguments.

## Features

- **DCMTK** (optional): DICOM tools for file handling and network operations
- **GDCM** (optional): Additional imaging tools for DICOM operations
- **Networking Utilities** (optional): Tools such as `curl`, `ping`, `traceroute`, etc.
- **ImageMagick**: Installed by default for image processing

## System Requirements

Ensure your system has Docker installed with the following minimum requirements:

- Docker >= 20.10.7
- OS: Linux, macOS, or Windows with WSL 2

## Build Arguments

This Docker image can be customized at build time using the following build arguments:

| Argument | Default | Description |
|----------|---------|-------------|
| `DCMTK`  | false   | Install DCMTK for DICOM network operations |
| `GDCM`   | false   | Install GDCM tools for additional imaging capabilities |
| `NET`    | false   | Install networking tools like `curl`, `traceroute`, and more |

## How to Build the Image

To build the image locally, clone the repository and navigate to the project directory. You can specify the desired tools by setting the build arguments.

For example, to build with DCMTK and GDCM enabled:

```bash
docker build -t docker-dcmkit . --build-arg DCMTK=true --build-arg GDCM=true
```

Alternatively, to include networking tools:

```bash
docker build -t docker-dcmkit . --build-arg NET=true
```

## How to Run the Container

Run the container with the following command. The example below runs with default settings (only **ImageMagick** and basic **ping**).

```bash
docker run -it --rm docker-dcmkit
```

If you included networking or DICOM tools during the build, they will be available within the container.

### Example for a Custom Build and Run

1. **Build** with specific tools enabled:

    ```bash
    docker build -t docker-dcmkit . --build-arg DCMTK=true --build-arg NET=true
    ```

2. **Run** the container and access the tools:

    ```bash
    docker run -it --rm docker-dcmkit
    ```

## DockerHub Automated Builds and Tags

This project uses GitHub Actions to automate the DockerHub image build and push process. When a new tag is pushed, multiple images with different configurations are built and tagged as follows:

- `-dcmtk`: Includes DCMTK tools for DICOM operations.
- `-gdcm`: Includes GDCM tools for additional DICOM imaging support.
- `-net`: Includes extended networking utilities.

For example, an image tagged `v1.0-dcmtk-gdcm-net` would include DCMTK, GDCM, and networking utilities.

## Contributing

We welcome contributions! Please feel free to fork this repository and submit a pull request. Follow our contribution guidelines outlined in the repository.

## Reporting Issues

If you encounter any issues, please report them on the [GitHub Issues](https://github.com/donnimsipa/docker-dcmkit/issues) page, providing a detailed description of the problem and steps to reproduce it.