#!/usr/local/bin/bash

[ "$DEBUG" == 'true' ] && set -x

VENV=${PWD}/.virtualenv
CTD_IMG=f5devcentral/containthedocs:latest
COMMAND="make -C docs/ html"

function ctd-make() {
  docker run --rm -i \
    -v "$PWD":"$PWD" --workdir "$PWD" \
    ${DOCKER_RUN_ARGS} \
    -e "LOCAL_USER_ID=$(id -u)" \
    ${CTD_IMG} ${COMMAND}
}

function code-server() {
  docker run -it --name code-server -p 127.0.0.1:8080:8080 \
    -v "$HOME/.config:/home/coder/.config" \
    -v "$PWD:/home/coder/project" \
    -u "$(id -u):$(id -g)" \
    -e "DOCKER_USER=$USER" \
    --rm \
    code-server-etd:latest /home/coder/project
}

# codercom/code-server:latest

function setup-python() {
  echo "// setup Python virtual environment"

  if [ ! -d ${VENV} ]
  then
    python3 -m venv ${VENV}
    pip3 install -r ${PWD}/requirements.txt

  else
    echo ">> virtual environment exists!"
  fi

  if [ -d ${VENV} ]
  then
    source ${PWD}/${VENV}/bin/activate
    pip3 install -r ${PWD}/requirements.txt

    echo ">> Python packages installed!"
  fi
}

function pre-commit() {
  echo "// setup Git pre-commit hooks"
  setup-python

  pip install pre-commit

  if [ ! -f "${PWD}/.pre-commit-config.yaml" ]
  then
    echo ">> grabbing .pre-commit-config.yaml"
    wget https://raw.githubusercontent.com/6a6d/f5-rtd-howto/master/.pre-commit-config.yaml
    pre-commit install
  fi
}

function code-server-install() {
  echo "// code-server install"

  # working release (2020.5.80290) of ms python extension for code-server
  #https://github.com/microsoft/vscode-python/releases/download/2020.5.80290/ms-python-release.vsix

  mkdir -p ~/.config

  #curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run

  code-server
}

function code-server-configure() {
  echo "// code-server configure"

  cat extensions.txt | while read extension || [[ -n $extension ]];
  do
    code-server --install-extension $extension --force
  done
}

##
# main
##
if [ "${1}" == "" ]
then
  setup-python

elif [ "${1}" == "code-server-setup" ]
then
  code-server-install
  code-server-configure

elif [ "${1}" == "code-server" ]
then
  code-server

elif [ "${1}" == "ctd" ]
then
  ctd-make

elif [ "${1}" == "pre-commit" ]
then
  pre-commit
fi
