#!/bin/sh

PKGNAME=aurora-cli
SUPPORTEDARCHES="x86_64"
VERSION="$2"
DESCRIPTION="A collection of scripts to help the Aurora OS developer"
URL="https://snapcraft.io/aurora-cli"

. $(dirname $0)/common.sh

PKGURL="$(snap_get_pkgurl $PKGNAME)"
install_pkgurl
