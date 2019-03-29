def is_pangram(sentence):
    from string import ascii_lowercase
    alph = set(ascii_lowercase)
    return set(sentence.lower()).intersection(alph) == alph
