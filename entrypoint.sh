#!/bin/sh

usage() {
    templater -h
    exit 1
}

# Inputs are available (set by GitHub) as env variables with the INPUT_ prefix and uppercased
# e.g. INPUT_DOCKERFILE_TPL is the value of the dockerfile_tpl input
# see https://help.github.com/en/articles/metadata-syntax-for-github-actions#example
# Parse and validate the inputs
echo "Running templater with the version: $(dockerfile-templater --version)"
if test -n "$INPUT_*"; then

		# set the required options
    if test -z "$INPUT_DOCKERFILE_TPL"; then
        echo "ERROR: No dockerfile template specified."
        usage
    fi

    if test -z "$INPUT_VARIANTS_DEF"; then
        echo "ERROR: No dockerfile variants specified."
        usage
    fi
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

		templater "$@"
else
		echo "ERROR: No inputs specified."
		usage
fi
