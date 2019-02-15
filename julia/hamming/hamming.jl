function distance(s1::String, s2::String)::Int
    length(s1) != length(s2) ? throw(ArgumentError("strings do not have same length")) : nothing
    cmp = ( collect(s1) .== collect(s2) )
    count(map(!,cmp)) # length(s1) - count(cmp)
end
