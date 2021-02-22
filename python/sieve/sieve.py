
from math import floor, sqrt
from numpy import where


def primes(n: int):
    candidates = [True] * (n+1)
    for i in range(2, floor(sqrt(n) + 1)):
        if candidates[i]:
            for j in range(i**2, n + 1, i):
                candidates[j] = False

    return list(where(candidates)[0][2::])

if __name__ == "__main__":
    primes = primes(10)
    print(primes)