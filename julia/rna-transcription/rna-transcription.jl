function to_rna(dna::String)
    unique(dna) ⊆ ['A', 'C', 'G', 'T'] ? nothing : throw(ErrorException("invalid nucleotides in dna."))
    d = Dict('G'=>'C','C'=>'G','T'=>'A','A'=>'U')
    join([d[nuc] for nuc in dna])
end
