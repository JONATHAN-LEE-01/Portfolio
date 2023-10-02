"""
HUMP FUNCTION
    Input:
        x - column vector (LENGTH 2)
    Output:
        r = scalar
        g = gradient vector
"""
# Test Function in Use:
#   Hump Function: f(x) = 4x1^2 - 2.1x1^4 + (x1^6)/3 + x1x2 - 4x2^2
#   has 15 stationary points where grad(f(x)) = 0
#       Note: The true minimum is near +-(0.1, -0.7)^T.
def myHump(x):
    if x.shape != (2, 1):
        raise ValueError("Test function requires x to be a vector of length 2..")
    x1, x2 = x[0], x[1]
    r = (4 - 2.1 * x1 ** 2 + (x1 ** 4) / 3) * x1 ** 2 + x1 * x2 + (-4 + 4 * x2 ** 2) * x2 ** 2
    dr_dx1 = (8 * x1 ** 3 - 8.4 * x1 + 2 * x1 * x2)
    dr_dx2 = (2 * x1 + 16 * x2 ** 3 - 8 * x2)
    g = np.array([dr_dx1, dr_dx2])
    return r, g
# HUMP INPUT
x = np.array([1.5, 2.5])
# HUMP OUTPUT:
[r, g] = myHump(x)
print("Hump Output:")
print("r =", r)
print("g =", g)
