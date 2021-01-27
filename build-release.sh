#!/bin/bash
docker build --no-cache -t hackinglab/alpine-gotty:$1.0 -t hackinglab/alpine-gotty:$1 -t hackinglab/alpine-gotty:latest -f Dockerfile .

docker push hackinglab/alpine-gotty
docker push hackinglab/alpine-gotty:$1
docker push hackinglab/alpine-gotty:$1.0

