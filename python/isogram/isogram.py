def is_isogram(string):
    # pre-processing of input
    for c in [" ", "-"]:
        string = string.replace(c,"")
    # check for isogram
    return len(set(string.lower())) == len(string)
