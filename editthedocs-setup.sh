#!/usr/local/bin/bash

[ "$DEBUG" == 'true' ] && set -x

##
# global variables
##
VENV=${PWD}/.virtualenv
CTD_IMG=f5devcentral/containthedocs:latest
PC_CONFIG=https://raw.githubusercontent.com/6a6d/f5-rtd-howto/master/.pre-commit-config.yaml

##
# supporting functions
##
function _activate() {
  source ./${VENV}/bin/activate
}

# development environment setup
function setup-dev-environment() {
  echo "// setup Python virtual environment"

  if [ ! -d ${VENV} ]
  then
    python3 -m venv ${VENV}
    _activate
    pip3 install --upgrade pip
    pip3 install -r ${PWD}/requirements.txt
    pip3 install pre-commit

  else
    echo ">> virtual environment exists!"
  fi

  if [ -d ${VENV} ]
  then
    _activate
    pip3 install --upgrade pip
    pip3 install -r ${PWD}/requirements.txt
    pip3 install pre-commit

    echo ">> Python packages installed!"
  fi

  pc-setup
}

# pre-commit setup
function pc-setup() {
  echo "// setup Git pre-commit hooks"

  if [ -f "${PWD}/.pre-commit-config.yaml" ]
  then
    echo ">> .pre-commit config exists!"

  elif [ ! -f "${PWD}/.pre-commit-config.yaml" ]
  then
    echo ">> grabbing .pre-commit config"
    wget ${PC_CONFIG}
    pre-commit install
  fi

  pre-commit run --all-files
}

##
# main
##
if [ "${1}" == "" ]
then
  setup-dev-environment

elif [ "${1}" == "pre-commit" ]
then
  pc-setup
fi
