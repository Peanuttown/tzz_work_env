FROM ubuntu:18.04
WORKDIR /tzz
RUN apt-get update
RUN which gcc || apt install gcc -y
RUN which python3 || apt install python3 -y
RUN apt-get install -y build-essential scons pkg-config libx11-dev libxcursor-dev libxinerama-dev libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev yasm

