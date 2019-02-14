function count_nucleotides(strand::String)
    d = Dict('A'=>0,'G'=>0,'C'=>0,'T'=>0)
    for s in strand
        haskey(d,s) ? d[s] += 1 : throw(DomainError("`$s` is no nucleotide."))
    end
    return d
end
