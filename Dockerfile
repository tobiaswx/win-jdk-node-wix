FROM mcr.microsoft.com/dotnet/sdk:8.0-windowsservercore-ltsc2022 as build

USER ContainerAdministrator
ADD "https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.2%2B13/OpenJDK21U-jdk_x64_windows_hotspot_21.0.2_13.zip" /tmp/
RUN pwsh -Command "Expand-Archive -Path C:\\tmp\\OpenJDK21U-jdk_x64_windows_hotspot_21.0.2_13.zip -DestinationPath C:\\tmp"

ADD "https://github.com/wixtoolset/wix3/releases/download/wix314rtm/wix314-binaries.zip" /tmp
RUN pwsh -Command "Expand-Archive -Path C:\\tmp\\wix314-binaries.zip -DestinationPath C:\\tmp\\wix314-binaries"

ADD "https://nodejs.org/dist/v20.11.1/node-v20.11.1-win-x64.zip" /tmp
RUN pwsh -Command "Expand-Archive -Path C:\\tmp\\node-v20.11.1-win-x64.zip -DestinationPath C:\\tmp"

FROM mcr.microsoft.com/dotnet/sdk:8.0-windowsservercore-ltsc2022
ARG destination="C:\\Program Files"
ARG wixfoldername="WiX Toolset v3.14.0"

COPY --from=build C:\\tmp\\jdk-21.0.2+13 ${destination}\\Java\\jdk-21.0.2+13
COPY --from=build C:\\tmp\\node-v20.11.1-win-x64 ${destination}\\node-v20.11.1-win-x64
COPY --from=build C:\\tmp\\wix314-binaries ${destination}\\${wixfoldername}

RUN setx /M JAVA_HOME "C:\\Program Files\\Java\\jdk-21.0.2+13"
RUN setx /M PATH "%PATH%;C:\\Program Files\\Java\\jdk-21.0.2+13\\bin;C:\\Program Files\\WiX Toolset v3.14.0;C:\\Program Files\\node-v20.11.1-win-x64"
