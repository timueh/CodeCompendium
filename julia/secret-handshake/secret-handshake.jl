function secret_handshake(code::Integer)
    (code <= 0 || code >= 32) && return []
    actions = Dict( 1=>"wink",
                    2=>"double blink",
                    3=>"close your eyes",
                    4=>"jump" )
    s = reverse(string(code, base=2))
    ends, rev = length(s) <= 4 ? (length(s), false) : (4, true)
    handshake = Vector{String}()
    # sizehint!(handshake,count_ones(code))
    for (i,letter) in enumerate(s[1:ends])
        letter == '1' && push!(handshake,actions[i])
    end
    rev ? reverse(handshake) : handshake
end
