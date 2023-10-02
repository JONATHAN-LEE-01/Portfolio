"""
ROSENBROCK TEST FUNCTION
    Input:
        x - column vector (LENGTH 2)
    Output:
        r - scalar
        g - gradient vector
"""
# Test Function in use:
#       The Rosenbrock Function: f (x) = (a − x_1)^2 + b*(x2 − x1^2)^2
#       Has a global minimum at (a1, a2)^T. Good tests come up when b ≥ 100*a > 0.
#           Note: a and b are hardcoded values.

import numpy as np
def rosenbrock(x):
    if x.shape != (2, 1):
        raise ValueError("x is not a column vector of length 2")
    x1, x2 = x[0], x[1]
    a = 1
    b = 12
    r = (a - x1) ** 2 + b * (x2 - x1 ** 2) ** 2
    # Evaluates gradient of Rosenbrock test function at x:
    dr_dx1 = -2 * (a - x1) - 4 * b * x1 * (x2 - x1 ** 2)
    dr_dx2 = 2 * b * (x2 - x1 ** 2)
    g = np.array([dr_dx1, dr_dx2])
    return r, g
# Rosenbrock Input (Can enter any input of appropriate dimension):
x = np.array([[1.5], [2.5]])
# Rosenbrock Output:
[r, g] = rosenbrock(x)
print("Rosenbrock Test Output:")
print("r =", r)
print("g =", g)
