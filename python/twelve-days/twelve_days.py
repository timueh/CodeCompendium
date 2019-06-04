def recite(start_verse, end_verse):
    items = { 1:"a Partridge in a Pear Tree", 2:"two Turtle Doves",
                3:"three French Hens", 4:"four Calling Birds",
                5:"five Gold Rings", 6:"six Geese-a-Laying", 7:"seven Swans-a-Swimming",
                8:"eight Maids-a-Milking", 9:"nine Ladies Dancing",
                10:"ten Lords-a-Leaping", 11:"eleven Pipers Piping", 12:"twelve Drummers Drumming" }
    numbers = { 1:"first", 2:"second", 3:"third", 4:"fourth",
                5:"fifth", 6:"sixth", 7:"seventh", 8:"eighth", 9:"ninth",
                10:"tenth", 11:"eleventh", 12:"twelfth" }
    out = []
    for i in range(start_verse, end_verse + 1):
        out.append("On the " + numbers[i] + " day of Christmas my true love gave to me: " + list_items(i,items))
    return out

def list_items(n, items):
    if n == 1:
        return items[1] + "."
    else:
        interjection = ", and " if n == 2 else ", "
        return items[n] + interjection + list_items(n-1, items)
