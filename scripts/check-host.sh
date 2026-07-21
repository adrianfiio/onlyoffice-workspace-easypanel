#!/usr/bin/env bash
set -euo pipefail

echo "CPU:"
nproc

echo "Memória:"
free -h

echo "Disco:"
df -h /

echo "Swap:"
swapon --show || true

echo "Docker:"
docker --version

echo "Compose:"
docker compose version
