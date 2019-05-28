def raindrops(number):
    d = { 3:"Pling", 5:"Plang", 7:"Plong" }
    s = [ word for (digit, word) in d.items() if number % digit == 0 ]
    return "".join(s) or str(number)
