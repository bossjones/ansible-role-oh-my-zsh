#!/usr/bin/env bash

> ~/omz-debug.log

zsh -xvic exit &> ~/omz-debug.log

cat ~/omz-debug.log