import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import itertools as iter


class MyComplex:

    def __init__(self, real_part, imag_part):
        self.real_part = real_part
        self.imag_part = imag_part

    def __add__(self, z):
        return MyComplex(real(self) + real(z), imag(self) + imag(z))

    def __mul__(self, z):
        real_part = real(self) * real(z) - imag(self) * imag(z)
        imag_part = real(self) * imag(z) + imag(self) * real(z)
        return MyComplex(real_part, imag_part)

    def __repr__(self):
        sign = '+' if self.imag_part >= 0 else '-'
        return f"{self.real_part} {sign} j {abs(self.imag_part)}"


def real(z: MyComplex):
    return z.real_part


def imag(z: MyComplex):
    return z.imag_part


def magnitude(z: MyComplex):
    return (real(z)**2 + imag(z)**2)**0.5


def findMandelbrotColor(c: MyComplex, N=60, absmax=1e4):
    n = 0
    z = MyComplex(0, 0)
    while magnitude(z) <= absmax and n < N:
        z = z + z * z + c
        n = n + 1
    return 1 - n / N


xAxis, yAxis = np.arange(-2, 0.3, 0.01), np.arange(-1, 1, 0.005)
z = []
for (x_, y_) in iter.product(xAxis, yAxis):
    z.append(findMandelbrotColor(MyComplex(x_, y_)))

z = np.reshape(z, (len(xAxis), len(yAxis)))
z = np.transpose(z)
plt.imshow(z, origin='lower', extent=[
           xAxis.min(), xAxis.max(), yAxis.min(), yAxis.max()])
plt.show()
