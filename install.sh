#!/usr/bin/env bash

# OVERRIDES: Use relative directory if travis
if [[ "${_TRAVIS_CI}x" == "x" ]]; then
  # NOTE: 6/3/2018 newly added
  # Ask for the administrator password upfront.
  sudo -v
fi

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get current dir (so run this script from anywhere)

if [[ "${SKIP_DOTFILES_PROVISION}x" == "x" ]]; then
  echo "Provision machine using ansible playbook.yml"
  command-exists ansible && bash .ci/provision.sh
fi
