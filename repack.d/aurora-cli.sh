#!/bin/sh

BUILDROOT="$1"
SPEC="$2"

. $(dirname $0)/common.sh

add_bin_exec_command $PRODUCT $PRODUCTDIR/bin/aurora_cli

add_libs_requires