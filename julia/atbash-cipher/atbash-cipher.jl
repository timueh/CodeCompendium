function encode(input::String;N::Int=5)
    clean = filter(c->isletter(c) || isnumeric(c), lowercase(input))
    chunks = Iterators.partition(map(encode,clean),N)
    join([join(chunk) for chunk in chunks]," ")
end

# core function -- needs to be called for lowercase `c` and clean input
function encode(c::Char)
    isnumeric(c) && return c
    'z' - (c - 'a')
end

function decode(input::String)
    clean = filter(c->!isspace(c),input)
    map(encode,clean)
end
