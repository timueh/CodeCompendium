function detect_anagrams(subject::AbstractString, candidates::AbstractArray)
    [ c for c in candidates if lc(subject) != lc(c) && sort(collect(lc(c))) == sort(collect(lc(subject))) ]
end

lc(s) = lowercase(s)
