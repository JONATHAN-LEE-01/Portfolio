"""
BOOTH FUNCTION
    Input:
        x - column vector (LENGTH 2)
    Output:
        r = scalar
        g = gradient vector
"""
# Test Function in Use:
#   Booth Function: r(x) = x1 + 2x2 - 7)^2 + (2x1 + x2 - 5)^2
#   Note: This function is quadratic so Newton's method will find a minimum but other methods may struggle.
# Booth function
def myBooth(x):
    if x.shape != (2, 1):
        raise ValueError("Test function requires x to be a vector of length 2.")
    x1, x2 = x[0], x[1]
    r = (x1 + 2 * x2 - 7) ** 2 + (2 * x1 + x2 - 5) ** 2
    # Evaluates gradient of Booth function.
    dr_dx1 = 10 * x1 + 8 * x2 - 34
    dr_dx2 = 8 * x1 + 10 * x2 - 38
    g = np.array([[dr_dx1], [dr_dx2]])
    return r, g
# BOOTH INPUT:
x = np.array([1.5, 2.5])
# BOOTH OUTPUT:
[r, g] = myBooth
print("Booth Input:")
print("r=", r)
print("g =", g)


# Rosenbrock function (with a=1, b=100)
def myRosenbrock(x):
    if x.shape != (2,):
        raise ValueError("x must be a 2D vector.")
    x1, x2 = x
    r = (1 - x1)**2 + 100*(x2 - x1**2)**2
    g = np.array([-2*(1 - x1) - 400*x1*(x2 - x1**2),
                  200*(x2 - x1**2)])
    return r, g
