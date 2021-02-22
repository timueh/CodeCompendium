#!/usr/bin/env bash

error () {
    printf '%s\n' "$*"
    exit 1
}

main () {
    (( $# == 1 )) || error "Usage: error_handling.sh <person>"

    name=$1
    echo "Hello, $name"
}
# call main with all of the positional arguments
main "$@"
