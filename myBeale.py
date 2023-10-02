"""
BEALE TEST FUNCTION
    Input:
        x - column vector (LENGTH 2)
    Output:
        r - scalar
        g - gradient vector
"""
# Test Function in use:
#       Beale Function: f (x) = (1.5 - x1 - x1x2)^2 + (2.5 - x1 + x1x2^2)^2 +2.625 - x1 + x1x2^3)^2
#       Has a minimum at (2.6, -0.35)^T.
#           Note: There are a total of four points where grad(F(X)) = 0.
def myBeale(x):
    if x.shape != (2,):
        raise ValueError("Test function requires x to be a vector of length 2.")
    x = np.array([1, 0])
    x1, x2 = x
    r = (1.5 - x1 + x1 * x2) ** 2 + (2.5 - x1 + x1 * x2 ** 2) ** 2 + (2.625 - x1 + x1 * x2 ** 3) ** 2
    # Evaluates gradient of Beale test function at x.
    dr_dx1 = 2 * (x2 - 1) * (x1 * x2 - x1 + 1.5) + 2 * (x2 ** 2 - 1) * (x1 * x2 ** 2 - x1 + 2.5) + 2 * (x2 ** 3 - 1) * (
                x1 * x2 ** 3 - x1 + 2.265)
    dr_dx2 = 2 * (x1 * x2 - x1 + 1.5) + 4 * x1 * (x2 ** 2 - x1 + 2.5) + 6 * x2 ** 2 * (x1 * x2 ** 3 - x1 + 2.625)
    g = np.array([dr_dx1, dr_dx2])
    return r, g
# BEALE INPUT:
x = np.array([1.5, 2.5])
# BEALE OUTPUT:
[r, g] = myBeale(x)
print("Beale Output:")
print("r =", r)
print("g =", g)
