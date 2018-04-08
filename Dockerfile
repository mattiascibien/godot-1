FROM debian:jessie-slim

MAINTAINER Karl J. Overå <karl@karl.run>

ARG GODOT_VERSION=3.0.2
ARG GODOT_VARIANT=stable

RUN apt-get update \
    && apt-get install -y wget unzip git ssh \
    && wget \
"http://download.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_VARIANT}_linux_server.64.zip" \
"http://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_VARIANT}_export_templates.tpz" \
    && unzip Godot_v*_linux_server.64.zip \
    && mv Godot_v*_linux_server.64 /bin/godot \
    && mkdir ~/.godot \
    && unzip -d ~/.godot Godot_v*_export_templates.tpz \
    && rm -f *.zip *.tpz \
    && apt-get purge -y --auto-remove wget unzip \
    && rm -rf /var/lib/apt/lists/*
