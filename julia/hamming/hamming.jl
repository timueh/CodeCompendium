function distance(s1::String, s2::String)::Int
    length(s1) != length(s2) && throw(ArgumentError("strings do not have same length"))
    count(map(!=,s1,s2))
end
