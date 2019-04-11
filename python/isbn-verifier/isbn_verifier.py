def verify(isbn):
    isbn = isbn.replace("-","")

    # exception handling
    if len(isbn) != 10: return False
    if not isbn[:-1].isnumeric(): return False
    if not (isbn[-1] == "X" or isbn[-1].isnumeric()): return False

    # syntax correct, check whether valid
    dgts = [ 10 if c == "X" else int(c) for c in isbn ]
    return sum( (10-i)*d for i, d in enumerate(dgts) ) % 11 == 0
