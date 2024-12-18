# from https://github.com/Ammar7077/docker_flutter_web/blob/main/my_flutter_web_app/Dockerfile
FROM ubuntu:latest AS build-env

RUN apt-get update
# Install necessary dependencies for running Flutter on web
RUN apt-get install -y libxi6 libgtk-3-0 libxrender1 libxtst6 libxslt1.1 curl git wget unzip gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set Flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor -v
RUN flutter channel master
RUN flutter upgrade

# Enable web support
RUN flutter config --enable-web

RUN mkdir /app/
COPY . /app/
# Set the working directory inside the container
WORKDIR /app/

# Build the Flutter web application
RUN flutter build web --release --wasm

FROM nginx:mainline-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
RUN sed -i 's/^ *\s*application\/javascript.*/    application\/javascript                                         js mjs;/g' /etc/nginx/mime.types
# EXPOSE <EXPOSE PORT THAT YOU WANT>
EXPOSE 80
