import string


def pre_process(words):
    for char in ["-", "_"]:
        words = words.replace(char, " ")
    return words


def get_initial(word):
    if len(word) == 0:
        return ""
    else:
        for char in word:
            if char.isalpha():
                return char.upper()


def abbreviate(words):
    words = pre_process(words)
    split_words = words.split(" ")
    first_letters = map(get_initial, split_words)
    return "".join(first_letters)


if __name__ == "__main__":
    print(abbreviate("Complementary metal-oxide semiconductor"))
