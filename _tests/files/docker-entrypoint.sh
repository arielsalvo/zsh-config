#!/usr/bin/env bash

if [[ ! -z ${USE_PROXY:-''} ]]; then
  git config --global http.proxy ${USE_PROXY:-''}
  git config --global http.sslVerify false
fi

echo "Your playground is ready"
echo "Connect to the container's terminal and execute zsh"

sleep infinity
