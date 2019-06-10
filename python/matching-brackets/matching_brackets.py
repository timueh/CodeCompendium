def is_paired(input_string):
    left, right = ["[","{","("], ["]","}",")"]
    stack = []
    for char in input_string:
        if char in left:
            stack.append(char)
        elif char in right:
            index = right.index(char)
            if not ( stack and left[index] == stack.pop() ):
                return False
    return not stack
