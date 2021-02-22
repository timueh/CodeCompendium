#!/usr/bin/env bash

main () {
    N=$1
    out=""
    sounds=( "Pling" "Plang" "Plong" )
    divisors=( 3 5 7 )
    for i in ${!divisors[@]}; do
        div=${divisors[$i]}
        sound=${sounds[$i]}
        (( $N % $div == 0 )) && out+=$sound
    done
    echo "${out:-$N}"
}

main "$@"
