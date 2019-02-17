function encode(input::String;N::Int=5)
    s = decode(input)
    if length(s)<=N
        return s
    else
        # break into groups of size $N$ with trailing space
        chunks = collect(m.match for m in eachmatch(Regex("(.{1,$N})"),s))
        return join(map(mys->mys *= " ",chunks))[1:end-1]
    end
end

# core function -- needs to be called for lowercase `c`
function encode(c::Char)
    if isspace(c) || ispunct(c)
        return ""
    elseif c in 'a' : 'z'
        return Char( 'z' - (c - 'a') )
    else
        return c
    end
end

decode(input::String) = join([encode(letter) for letter in lowercase(input)])
