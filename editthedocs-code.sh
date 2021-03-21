#!/usr/bin/env bash

set -x

exec brew services start code-server
exec cat $HOME/.config/code-server/config.yaml
