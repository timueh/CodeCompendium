function secret_handshake(code::Integer)
    (code <= 0 || code >= 32) && return []
    actions = ["wink", "double blink", "close your eyes", "jump"]
    pick = Bool.(digits(code, base=2, pad=5))
    s = actions[pick[1:4]]
    pick[end] ? reverse(s) : s
end
