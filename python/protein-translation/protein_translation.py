# DISCLAIMER: no exception handling whatsoever
# pre-processing begin
maps_init = {
("AUG",): "Methionine",
("UUU", "UUC"): "Phenylalanine",
("UUA", "UUG"): "Leucine",
("UCU", "UCC", "UCA", "UCG"): "Serine",
("UAU", "UAC"): "Tyrosine",
("UGU", "UGC"): "Cysteine",
("UGG",): "Tryptophan",
("UAA", "UAG", "UGA"): "STOP"
}
global maps
maps = {}
for k, v in maps_init.items():
    for key in k:
        maps[key] = v
# pre-processing end


def proteins(strand):
    p = []
    for i in range(0,len(strand)//3):
        protein = maps[strand[i*3:(i+1)*3]]
        if protein == "STOP": break
        p.append(protein)
    return p
