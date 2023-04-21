#!/bin/bash

docker build -t scherlac/squid:latest .
docker push scherlac/squid:latest
