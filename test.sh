#!/bin/sh

docker-compose down;
docker image rm mhzawadi/phpipam:dev && \
docker build -f Dockerfile-dev -t mhzawadi/phpipam:dev . && \
docker-compose -f docker-compose.yml up
