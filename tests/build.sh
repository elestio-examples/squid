#!/usr/bin/env bash
sed -i "s~ARG SQUID_VER=6.4~ARG SQUID_VER=6.3~g" Dockerfile
docker buildx build . --output type=docker,name=elestio4test/squid:latest | docker load