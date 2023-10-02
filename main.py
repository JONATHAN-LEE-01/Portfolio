# Author: Jonathan Lee
# Date: 4/30/2023
# Title: M/CS 435 HW 3
# Description: This script implements the following algorithims:
#   (1) L-BFGS
#   (3) Polak-Ribiere
import numpy as np

# Test myLBFGS function
Q = np.array([[5, 1], [1, 1]])
b = np.array([-1, 2])
x = np.array([0, 0])
tol = 1e-6

"""
LINE SEARCH AND STEEPEST DESCENT ASSIGNMENT
"""


# Defining objective function
def myQuad(x, Q, b):
    fx = 0.5 * np.dot(x.T, np.dot(Q, x)) - np.dot(b.T, x)  # objective function
    gx = np.dot(Q, x) - b  # gradient of function
    return fx, gx


# Defining myArmijo function:
def myArmijo(x, f, p, c, maxa, r):
    a = maxa  # initializing the step size to the maximum size of a
    fx, gx = f(x, *p)  # calculating the f and g at x
    dx = -gx  # setting direction to be negative of g
    while f(x + a * dx, *p)[0] > fx + c * a * np.dot(gx, dx):  # Beginning of Armijo Search Loop
        a *= r  # reducing step size by the backtracking facto
        if a >= 1 ** -10:
            pass
    return a


"""
QUASI NEWTON METHODS ASSIGNMENT
"""
# Objective function
func = lambda x: myQuad(x, Q, b)


# Computing gradient in objective function at the specific point x.
"""def compute_gradient(x, func):
    h = 1e-6
    g = np.zeros_like(x)
    for i in range(len(x)):
        ei = np.zeros_like(x)
        ei[i] = h
        g[i] = (func(x + ei) - func(x - ei)) / (2 * h)
    return g
"""
def compute_gradient(x, func):
    h = 1e-6
    eps = np.eye(len(x)) * h
    gradient = np.array([(func(x + eps_i) - func(x - eps_i)) / (2 * h) for eps_i in eps])
    return gradient



"""
LBFGS Quasi-Newton Method
    inputs:
        x - starting point
        func - objective function
        tol - stopping criterion's tolerance for checking the norm of the gradient
    Outputs:
        newx - optimal solution of function f or point at which gradient is small enough
        nfunc - total number of evaluations of the objective function
        grad - norm of the gradient at newx
"""


def myLBFGS(x, func, tol):
    global gradnorm
    maxiter = 100  # maximum number of iterations
    m = 5  # number of previous iterations to remember
    eps = np.finfo(float).eps  # machine epsilon
    n = len(x)  # dimension of optimization variables

    # Initialize variables
    nfunc = 0  # number of function evaluations
    s = []  # list of previous search directions
    y = []  # list of previous gradient differences
    rho = []  # list of corresponding step sizes
    gk = compute_gradient(x.T, func)  # current gradient
    nfunc += 1
    dk = -gk  # initial search direction
    alpha = myArmijo(x, func, dk, 1e-4, 1, 0.5)  # initial step size
    nfunc += 1
    newx = x + alpha * dk  # initial point
    newgrad = compute_gradient(newx, func)  # next gradient
    nfunc += 1

    # LBFGS optimization loop
    for k in range(maxiter):
        # Compute search direction using L-BFGS formula
        q = newgrad
        a = []
        for i in range(len(s) - 1, -1, -1):
            ai = rho[i] * np.dot(s[i].T, q)
            q -= ai * y[i]
            a.append(ai)
        r = q / np.dot(y[-1], y[-1])
        z = a[::-1]
        for i in range(len(s)):
            bi = rho[i] * np.dot(y[i], r)
            r += s[i] * (z[i] - bi)

        # Update search history
        sk = newx - x  # new search direction
        yk = newgrad - gk  # new difference in gradient
        rho_k = 1 / np.dot(yk, sk)  # new step size
        if len(s) == m:  # if the number of stored search directions m is reached
            s.pop(0)  # remove the oldest search direction
            y.pop(0)  # remove the oldest grad difference
            rho.pop(0)  # remove the oldest step size
        s.append(sk)  # stores newest search direction
        y.append(yk)  # stores newest grad difference
        rho.append(rho_k)  # stores newest step size

        # Perform line search
        alpha = myArmijo(newx, func, -r, 1e-4, 1, 0.5)
        nfunc += 1

        # Update current point and gradient
        xk1 = newx + alpha * (-r)
        gk = newgrad
        newgrad = compute_gradient(xk1, func)
        nfunc += 1

        # Check convergence
        if np.linalg.norm(newgrad) <= tol:
            break

        # Update point for next iteration
        x = newx
        newx = xk1
        gradnorm = np.linalg.norm(newgrad)

    return [newx, nfunc, gradnorm]


# Loop myArmijo over two functions and print results
print("LBFGS OUTPUTS (test)")

results = myLBFGS(x, func, tol)
print("Optimal point: ", results[0])
print("Number of function evaluations: ", results[1])
print("Gradient norm at optimal point: ", results[2])
# Set the starting point for the optimization
x0 = np.array([0, 0])

# Print the results
[newx, nfunc, gradnorm] = myLBFGS(x, func, tol)
print("Optimal solution:", newx)
print("Number of function evaluations:", nfunc)
print("Norm of the gradient at the optimal solution:", gradnorm)

# Test if newx is closer to the minimizer than x0
minimizer = np.array([1.0, 2.5])
dist_newx = np.linalg.norm(newx - minimizer)
dist_x0 = np.linalg.norm(x0 - minimizer)
print("Distance from newx to minimizer:")
print(dist_newx)
print("Distance from x0 to minimizer:")
print(dist_x0)
