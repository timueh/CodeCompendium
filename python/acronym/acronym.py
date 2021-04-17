import string


def pre_process(words):
    for char in ['-', '_']:
        words = words.replace(char, ' ')
    return words


def abbreviate(words):
    words = pre_process(words)
    first_letters = map(lambda x: x[0].upper() if len(x) > 0 else '', words.split(' '))
    return ''.join(first_letters)
