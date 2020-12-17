#!/usr/bin/env bash

set -e

#-----------------------------------------------------------------------
# Linux (Linux/x86_64, Darwin/x86_64, Linux/armv7l)
#
# install-goss.sh - Install Go
#
# usage: install-goss.sh
#
# Use goss for serverspec-like testing
# @see https://goss.rocks
#
# Downloads, verifies, and installs
# Requires curl and sha256sum to be present
#
# Copyright (c) 2020 Malcolm Jones
# All Rights Reserved.
#-----------------------------------------------------------------------

GOSS_VERSION=v0.3.15


logmsg() {
    echo ">>> $1"
}

OS=$(uname -s)
ARCH=$(uname -m)

logmsg ">>> Install Goss ${VERSION}"

case ${ARCH} in
    x86_64)
        ARCH=amd64
    ;;
    armv7l)
        ARCH=armv6l
    ;;
    *) echo "${OS}-${ARCH} does'nt supported yet."; exit 1;;
esac

case ${OS} in
    Linux)
        OS=linux
        # Manually locate and commit from https://github.com/aelsabbahy/goss/releases/download/vX.Y.Z/goss-linux-amd64.sha256
        GOSS_SHA256=b893b70e66bb1d2031f1ecf72421fff0056fff2ae8f7a4317e91dc7a7f6f7eee
        URL=https://github.com/aelsabbahy/goss/releases/download/${GOSS_VERSION}/goss-linux-${ARCH}
        GOSS_DIR=/etc/goss/goss.d
    ;;
    Darwin)
        OS=darwin
        GOSS_SHA256=7274434cf2254e348ee59b9a26daebb5c52a1af1978bf7c83655f047b8614a76
        URL=https://github.com/aelsabbahy/goss/releases/download/${GOSS_VERSION}/goss-alpha-darwin-${ARCH}
        GOSS_DIR=/usr/local/etc/goss/goss.d
    ;;
    *)
        echo "${OS}-${ARCH} does'nt supported yet.";
        exit 1
    ;;
esac

curl -fL "${URL}" -o /usr/local/bin/goss

# NOTE: extra whitespace between SHA sum and location is intentional, required for Alpine
echo "${GOSS_SHA256}  /usr/local/bin/goss" | sha256sum -c - 2>&1 | grep OK
chmod +x /usr/local/bin/goss

goss --version

mkdir -p $GOSS_DIR || true

exit 0
