#!/usr/bin/env bash
# cp -rf ./packages/hoppscotch-backend/* ./
docker buildx build . --target backend --output type=docker,name=elestio4test/squid:latest | docker load