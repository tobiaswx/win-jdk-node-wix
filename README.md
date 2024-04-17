# Windows Server Core Docker Image with JDK 21, Node 20, and WiX Toolset 3.14
[![Docker](https://github.com/tobiaswx/win-jdk-node-wix/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/tobiaswx/win-jdk-node-wix/actions/workflows/docker-publish.yml)

This Docker image provides a Windows Server Core environment with JDK 21, Node.js 20, and WiX Toolset 3.14, tailored for CI/CD pipelines.

## Usage

You can use this Docker image to provision a pre-defined environment for your CI/CD pipelines.

## Contents

- **JDK**: OpenJDK 21.0.2+13
- **WiX Toolset**: Version 3.14.0
- **Node.js**: Version 20.11.1

## Availability
This image is available on [GitHub Container Registry](https://github.com/tobiaswx/win-jdk-node-wix/pkgs/container/win-jdk-node-wix).

```bash
docker pull ghcr.io/tobiaswx/win-jdk-node-wix:latest
```

## Using the Environment

Once the container is started, the following environment variables are set:

- `JAVA_HOME`: `C:\Program Files\Java\jdk-21.0.2+13`
- `PATH`: `%PATH%;C:\Program Files\Java\jdk-21.0.2+13\bin;C:\Program Files\WiX Toolset v3.14.0;C:\Program Files\node-v20.11.1-win-x64`

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
