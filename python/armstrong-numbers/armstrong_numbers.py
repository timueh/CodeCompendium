def is_armstrong(number: int):
    return sum( map(lambda i : int(i)**len(str(number)),str(number)) ) == number
