#!/usr/bin/env bash

> ~/omz-debug.log

zsh -xv &> >(tee ~/omz-debug.log 2>/dev/null)

cat ~/omz-debug.log