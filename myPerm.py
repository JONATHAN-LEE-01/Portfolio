# N-D Perm Function II
def myPerm(x):
    n = x.shape[0]
    if n < 2:
        raise ValueError("Test function requires x to be a vector of at least length 2.")
    r = 0
    g = n.zeros((n, 1))
    for i in range(n):
        term = 0
        for j in range(n):
            term += (j + 1 + 10 * (i + 1)) * ((x[j]) ** i - (1 / (j + 1)) ** i)
        r += term ** 2

        for j in range(n):
            g[j] += 2 * term * ((x[j]) ** i - (1 / (j + 1)) ** i) * i * ((j + 1) + 10 * (i + 1))
    g = g.reshape(n, 1)
    return r, g
