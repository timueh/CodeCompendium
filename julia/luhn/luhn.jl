function luhn(input::String)
    length(input) <= 1 && return false
    clean = filter(!isspace,input) |> reverse
    s = 0
    for (i,digit) in enumerate(clean)
        isletter(digit) && return false
        d = parse(Int,digit)
        s += iseven(i) ? (2*d>9 ? 2*d-9 : 2*d) : d
    end
    s % 10 == 0
end
