#!/usr/bin/env bash

# NOTE: SOURCE ME!!!!!!!!!!!!!!
# INFO: https://github.com/ohmyzsh/ohmyzsh/wiki/Troubleshooting

_USER=$(whoami)

compaudit | xargs chmod g-w,o-w
compaudit | xargs chown "$_USER"
rm ~/.zcompdump*
exec zsh