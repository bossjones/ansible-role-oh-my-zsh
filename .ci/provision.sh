#!/usr/bin/env bash

set -x

# export CHECK_ONLY=1

unamestr=$(uname)

# Warn that some commands will not be run if the script is not run as root.
if [[ $EUID -ne 0 ]]; then
    RUN_AS_ROOT=false
    printf "Certain commands will not be run without sudo privileges. To run as root, run the same command prepended with 'sudo', for example: $ sudo $0\n\n" | fold -s -w 80
else
    RUN_AS_ROOT=true
    # Update existing `sudo` timestamp until `.osx` has finished
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done 2>/dev/null &
fi

# OVERRIDES: Use relative directory if travis
if [[ "${_TRAVIS_CI}" == "1" ]]; then
    _PATH_TO_PYTHON=$(which python)
fi

ansible-galaxy install --force -r requirements.yml --roles-path roles/ -vvv
echo "localhost ansible_connection=local ansible_python_interpreter=${_PATH_TO_PYTHON}" >hosts.private

cat hosts.private

# Mac OS X
if [[ $unamestr == "Darwin" ]]; then
    echo "already bootstraped, run version manage now"
elif [[ $unamestr == "Linux" && -f $(which apt-get) ]]; then
    _USER=$(whoami)
    _GROUP=$(whoami)

    echo "already bootstraped, run version manage now"
fi

# TODO: Add variable files for different machines
# ansible-playbook install_version_managers.yml --skip-tags="nvm"
if [[ $unamestr == "Darwin" ]]; then
    _USER=$(whoami)
    _GROUP=staff
    _ARCH=$(uname -m)
    if [[ "${_ARCH}" = "arm64" ]]; then
        _PATH_TO_ZSH_INTERPERTER=/opt/homebrew/bin/zsh
    else
        _PATH_TO_ZSH_INTERPERTER=/usr/local/bin/zsh
    fi


    # If we set checkonly then run check, else run full suite
    if [[ "${CHECK_ONLY}" = "1" ]]; then
        ansible-playbook -vvvv -i "localhost," -c local --extra-vars="bossjones__oh__my__zsh__user=${_USER} bossjones__oh__my__zsh__group=${_GROUP} bossjones__oh__my__zsh__path_to_shell=${_PATH_TO_ZSH_INTERPERTER}" playbook_macos_pure.yml --check
    else
        ansible-playbook -vvvv -i "localhost," -c local --extra-vars="bossjones__oh__my__zsh__user=${_USER} bossjones__oh__my__zsh__group=${_GROUP} bossjones__oh__my__zsh__path_to_shell=${_PATH_TO_ZSH_INTERPERTER}" playbook_macos_pure.yml
    fi
elif [[ $unamestr == "Linux" && -f $(which apt-get) ]]; then
    _USER=$(whoami)
    _GROUP=$(whoami)
    ansible-playbook -vvvv playbook_ubuntu_pure.yml --extra-vars="bossjones__oh__my__zsh__user=${_USER} bossjones__oh__my__zsh__group=${_GROUP}"
fi
# popd
