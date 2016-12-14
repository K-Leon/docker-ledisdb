#!/usr/bin/env bash

docker login
docker build -t expert/ledisdb:4.13 .
docker push expert/ledisdb:4.13
docker logout
