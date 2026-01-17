# FTNN Desktop Flatpak Package

This repository provides the configuration and scripts necessary to build a Flatpak package for the FTNN Desktop application.

## Build Process

### Prerequisites

Ensure that Flatpak and `flatpak-builder` are installed on your system. Refer to your operating system's documentation for installation instructions.

### Building the Flatpak Application

1.  Navigate to the root directory of this repository.

2.  Execute the `flatpak-builder` command to initiate the build process:
    ```bash
    flatpak-builder --force-clean build-dir com.futunn.ftnn-desktop.yml
    ```
    This command will download the official `.deb` package, and then assemble the Flatpak application within the `build-dir` directory.

### Installing the Flatpak Application

Upon successful completion of the build, install the generated Flatpak package:

```bash
flatpak-builder --install-deps-from build-dir --install build-dir
```

### Running the Application

The installed FTNN Desktop application can be launched via your desktop environment's application launcher or by executing the following command:

```bash
flatpak run com.futunn.ftnn-desktop
```
