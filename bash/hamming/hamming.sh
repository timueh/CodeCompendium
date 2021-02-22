#!/usr/bin/env bash

error () {
    echo "$1" 1>&2
    exit 1
}

main () {
    # test for correct input
    (( $# == 2 )) || error "Usage: hamming.sh <string1> <string2>"

    s1=$1
    s2=$2
    # test for equal length
    (( ${#s1} == ${#s2} )) || error "left and right strands must be of equal length"

    # start actual program
    hamming_distance=0
    for (( i=0; i<${#s1}; i++ )); do
        char_1=${s1:$i:1}
        char_2=${s2:$i:1}
        if [[ "$char_1" != "$char_2" ]]
        then
            hamming_distance=$(($hamming_distance + 1))
        fi
    done
    echo "$hamming_distance"
}

# call main with all of the positional arguments
main "$@"
