#!/usr/bin/env bash

mkdir -p games

docker build --no-cache --rm -t mlbv:latest .
