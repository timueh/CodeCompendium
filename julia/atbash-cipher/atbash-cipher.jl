function encode(input::String;N::Int=5)
    s = decode(input)
    if length(s)<=N
        return s
    else
        # break into groups of size $N$ with trailing space
        # chunks = collect(m.match for m in eachmatch(Regex("(.{1,$N})"),s))
        ls = length(s)
        chunkrange = 1:N:ls
        chunks = Vector{String}()
        sizehint!(chunks, length(chunkrange))
        for r in chunkrange
            endr = min(r+N, ls+1) - 1
            push!(chunks, s[r:endr])
        end
        return join(chunks, " ")
    end
end

# core function -- needs to be called for lowercase `c`
function encode(c::Char)
    isnumeric(c)    && return string(c)
    c in 'a' : 'z'  && return string(Char( 'z' - (c - 'a') ))
    return ""
end

decode(input::String) = join(encode(letter) for letter in lowercase(input))
