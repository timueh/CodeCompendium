def what_does_the_fox_say():
  print("vixens cry")

class Matrix(object):
    def __init__(self, matrix_string):
        mat = []
        for line in matrix_string.split("\n"):
            row = []
            for l in line.split():
                row.append(int(l))
            mat.append(row)
        self.mat = mat

    def row(self, index):
        return self.mat[index-1]

    def column(self, index):
        return [ self.mat[i][index-1] for i in range(0, len(self.mat)) ]
