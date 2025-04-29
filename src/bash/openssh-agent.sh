#!/usr/bin/env zsh

## requiments: brew install openssh
## Starts openssh ssh-agent at a given path, good for custom ssh setups

if [[ "$(uname -p)" == "arm" ]]; then
  BREW_PATH=/opt/homebrew
else
  BREW_PATH=/usr/local
fi

SSH_AGENT="${BREW_PATH}/bin/ssh-agent"
SSH_AGENT_PATH=~/.openssh.agent
SSH_AGENT_TIMEOUT=8h

if [[ -x ${SSH_AGENT} ]] && [[ -z $(pgrep -f $SSH_AGENT) ]]; then
  SSH_AGENT_TMP_PATH=$(${SSH_AGENT} -t ${SSH_AGENT_TIMEOUT} -s | grep ^SSH_AUTH_SOCK | cut -d ';' -f 1 | cut -d '=' -f 2)
  ln -sf "${SSH_AGENT_TMP_PATH}" "${SSH_AGENT_PATH}"
  echo "Started ${SSH_AGENT} and linked ${SSH_AGENT_TMP_PATH} to ${SSH_AGENT_PATH}"
fi

export SSH_AUTH_SOCK="${SSH_AGENT_PATH}"

