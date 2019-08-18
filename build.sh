#!/usr/bin/env bash

mkdir -p games

docker build --rm -t mlb:latest .
