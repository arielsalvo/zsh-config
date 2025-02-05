# ZSH configuration testing grounds

## Requirements

This configuration requires:
* [Just](https://just.systems/) command runner
* Docker
* Docker Compose (usually included with Docker)
* Internet access

## The Stack

A base image is built on top of `ubuntu:latest`, installing required packages and setting up the desired locale, creating a test user and mounting the configurations as read-only files and directories.
The name and password of the user, as well as the locale to create can be overriden.

## Caveats

Only some files and directories are mounted and anything created by the configuration is only present within the container and will not be persisted.
Mounted files are read-only and can't be modified from within the container.

## Usage

### Building, Starting and Stopping

`Just` may be used to run these commands simply by executing `just` with no parameters for command selector or `just --list` to get a list.

To start the container, running `docker compose up -d --build` will build a new image if necessary, and start a service called `zshtest`.
Once the tests have been completed, `docker compose down` can be executed to destroy the container or `docker compose stop` to just stop it.

### Connecting to the container

To start a session in the container and apply the Zsh configuration run `docker compose exec zshtest /usr/bin/zsh`.
