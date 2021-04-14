#!/bin/bash

set -eEux

ROOT="$(pwd -P)"

cd "${ROOT}/greeter_client"
GOOS=linux go build -o ./app .
docker build -t 038528481894.dkr.ecr.ap-northeast-1.amazonaws.com/greeter_client:v2 .
docker system prune -f

cd "${ROOT}/greeter_server"
GOOS=linux go build -o ./app .
docker build -t 038528481894.dkr.ecr.ap-northeast-1.amazonaws.com/greeter_server:v9 .
docker system prune -f
