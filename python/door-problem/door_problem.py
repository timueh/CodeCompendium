import numpy as np
import copy
import matplotlib
import matplotlib.pyplot as plt


def toggleDoors(n):
    doors = -np.ones(n)
    allDoors = [copy.copy(doors)]
    for i in range(n):
        doors[range(i, n, i + 1)] *= -1
        allDoors.append(copy.copy(doors))
    return np.array(allDoors)


def main():
    doors = toggleDoors(100)
    plt.imshow(doors)
    plt.show()


if __name__ == "__main__":
    main()
