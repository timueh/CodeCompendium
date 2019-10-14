# def distance(s1,s2):
#     if len(s1) != len(s2):
#         raise Exception("inconsistent strand lengths")
#     c = 0
#     for i in range(0,len(s1)):
#         if s1[i] != s2[i]: c += 1
#     return c

def distance(s1,s2):
    return sum( l1 != l2 for l1, l2 in zip(s1,s2) )
