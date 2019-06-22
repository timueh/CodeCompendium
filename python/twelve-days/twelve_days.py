def recite(start_verse, end_verse):
    items = [
    'twelve Drummers Drumming, ',
    'eleven Pipers Piping, ',
    'ten Lords-a-Leaping, ',
    'nine Ladies Dancing, ',
    'eight Maids-a-Milking, ',
    'seven Swans-a-Swimming, ',
    'six Geese-a-Laying, ',
    'five Gold Rings, ',
    'four Calling Birds, ',
    'three French Hens, ',
    'two Turtle Doves, and ',
    'a Partridge in a Pear Tree.' ]
    numbers = [ 'first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth', 'ninth', 'tenth', 'eleventh' ,'twelfth' ]
    out = []
    for i in range(start_verse-1, end_verse):
        out.append("On the " + numbers[i] + " day of Christmas my true love gave to me: " + "".join(items[-i-1:]))
    return out
