#!/bin/sh

set -euo pipefail

usage() {
    dockerfile-templater -h
    exit 1
}

# Inputs are available (set by GitHub) as env variables with the INPUT_ prefix and uppercased
# e.g. INPUT_DOCKERFILE_TPL is the value of the dockerfile_tpl input
# see https://help.github.com/en/articles/metadata-syntax-for-github-actions#example
# Parse and validate the inputs
echo "Running dockerfile-templater version: $(dockerfile-templater --version 2>&1)"

set -- "--dockerfile.tpl" "$INPUT_DOCKERFILE_TPL" "--variants.def" "$INPUT_VARIANTS_DEF"

# set the optional options
if test -n "$INPUT_VARIANTS_CFG"; then
	set -- "$@" "--variants.cfg" "$INPUT_VARIANTS_CFG"
fi

if test -n "$INPUT_OUT_DIR"; then
	set -- "$@" "--out.dir" "$INPUT_OUT_DIR"
fi
# TODO: support dockerfile.var as stringArray
if test -n "$INPUT_DOCKERFILE_TPL_DIR"; then
	set -- "$@" "--dockerfile.tpldir" "$INPUT_DOCKERFILE_TPL_DIR"
fi
# TODO: support dockerfile.var as stringToString
if test -n "$INPUT_DOCKERFILE_VAR"; then
	set -- "$@" "--dockerfile.var" "$INPUT_DOCKERFILE_VAR"
fi

if test -n "$INPUT_VARIANTS_CFG"; then
		set -- "$@" "--variants.cfg" "$INPUT_VARIANTS_CFG"
fi

echo "Running dockerfile-templater with inputs:  $*"

dockerfile-templater "$@"
