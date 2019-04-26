def raindrops(number):
    d = { 3:"Pling", 5:"Plang", 7:"Plong" }
    s = ""
    for digit, s_ in d.items():
        if number % digit == 0: s += s_
    # alternative one-liner:
    # s = "".join( map(lambda x: d[x] if number % x == 0 else "", d.keys()) )
    if not s:
        return str(number)
    return s
