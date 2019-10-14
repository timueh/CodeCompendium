def count_words(sentence):
    # 1. find negations first
    # 2. replace punctuation characters with spaces
    # 3. split words
    sentence = sentence.lower()
    d = {}
    for neg in ["don't", "can't"]:
        if neg in sentence:
            d[neg] = sentence.count(neg)
            sentence = sentence.replace(neg,' ')
    for symbol in ['_', ',', '\n', '\*', ';', '.', '!','@','$','%','&','^',':',"'"]:
        sentence = sentence.replace(symbol,' ')
    words = sentence.split()
    for word in set(words):
        d[word] = words.count(word)
    return d
