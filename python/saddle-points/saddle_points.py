def saddle_points(A):
    if len(set(map(len,A))) > 1 : raise ValueError("irregular matrix")
    saddles = set()
    if len(set(map(len,A))) > 0 :
        rows, cols = map(lambda x : (range(0,x)), [len(A), len(A[0])])
        for row in rows:
            for col in cols:
                if A[row][col] >= get_max_row_value(A,row,col):
                    if A[row][col] <= get_min_col_value(A,row,col):
                        saddles.add((row+1,col+1))
    return saddles

def get_max_row_value(A,row,col):
    l = [ A[row][c] for c in range(len(A[0])) if c!=col ]
    if len(l) > 0:
        return max(l)
    return -float('Inf')

def get_min_col_value(A,row,col):
    l = [ A[r][col] for r in range(len(A)) if r!=row ]
    if len(l) > 0:
        return min(l)
    return float('Inf')
