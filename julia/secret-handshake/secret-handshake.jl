function secret_handshake(code::Integer)
    (code <= 0 || code >= 32) && return []
    actions = ["wink", "double blink", "close your eyes", "jump"]
    bits = 0:4
    s = map(i->code & 2^i == 2^i,bits)
    handshake = Vector{String}()
    for (i,l) in enumerate(s[1:end-1])
        l && push!(handshake,actions[i])
    end
    s[end] ? reverse(handshake) : handshake
end
