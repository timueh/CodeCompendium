def distance(s1,s2):
    if len(s1) != len(s2): raise ValueError("strands have inconsistent lengths")
    return sum( l1 != l2 for l1, l2 in zip(s1,s2) )
