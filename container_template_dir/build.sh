#!/bin/bash

# (optional) match your host UID/GID so mounted files aren’t root-owned
export UID=$(id -u)
export GID=$(id -g)

docker compose up --build -d
