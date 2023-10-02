# Author: Jonathan Lee
# Date: 4/30/2023
# Title: M/CS 435 HW 3
"""Description: This script implements the following algorithms:
        (0) Armijo Line Search
        (1) L-BFGS
        (3) Polak-Ribiere
 Assignment problems are held within comment blocks. Further descriptions of the
 functions and methods of approach are stated as comments above or directly after
 notable lines.
 Note to Rick:
        The more I worked on this, the more broken it got. I'll stop by your office on
        Monday to try and work it out.
"""
import numpy as np

# Define Armijo Parameters
c = 0.1  # scalar used to check Armijo
maxa = 1  # positive scalar giving max stepsize
r = 0.5  # scalar between 0 and 1 for use in backtracking algorithm

# Define myQuad Inputs
x = np.array([[-1.],
              [0.]])
Q = np.array([[5., 1],
              [1., 1]])
b = np.array([[-1.],
              [2]])
p = np.array([[-1.],
              [2]])

# LBFGS Parameters:
tol = 1e-6

"""
LINE SEARCH AND STEEPEST DESCENT ASSIGNMENT
"""


# Defining objective function
def myQuad(x, Q, b):
    fx = 0.5 * np.dot(x.T, np.dot(Q, x)) - np.dot(b.T, x)
    gx = np.dot(Q, x) - b
    return fx[0], gx


# Define Armijo Condition
def myArmijo(x, f, p, c, maxa, r):
    a = maxa  # initialize the step size to the maximum size of a
    fx, gx = f(x)  # calculate the f and g at x
    xk = x + (a * p)
    # Beginning of Armijo Search Loop
    while f(xk + a * p)[0] > fx + c * a * np.dot(gx.T, p)[0]:
        a *= r  # reduce step size by the backtracking factor
        if a >= 1e-10:
            pass
    return a


f = lambda x: myQuad(x, Q, b)

# Test myArmijo function
a = myArmijo(x, f, p, c, maxa, r)
x_new = x + a * np.linalg.solve(Q, -b)
fx_new, gx_new = f(x_new)

print("Step size: ", a)
print("New point: x_new =", x_new)
print("New value of function: f(x_new) =", fx_new)
print("Gradient at x_new: g(x_new) =", gx_new)

"""
QUASI NEWTON METHODS ASSIGNMENT
"""
func = lambda x: myQuad(x, Q, b)


# Compute gradient at each iteration
"""

def compute_gradient(x, func):
    h = 1e-6  # set step size
    g = np.zeros_like(x)  # create an array to store the gradient
    for i in range(len(x)):
        # create an array with only the i-th element as h
        ei = []
        e[i] = h
        # approximate the partial derivative
        g[i] = (func(x + ei) - func(x - ei)) / (2 * h)
    return g  # return gradient
"""

def myLBFGS(x, func, tol):
    # Initialize variables
    maxiter = 100  # maximum number of iterations
    m = 5  # number of previous iterations to remember
    nfunc = 0  # number of function evaluations = 0
    s_list = []  # list of previous search directions
    gx_list = []  # list of previous gradient differences
    rho = []  # list of corresponding step sizes
    fx, gx = func(x)  # current gradient
    nfunc += 1  # number of function evaluations= n+1
    alpha = myArmijo(x, func, pk, 1e-4, 1, 0.5)  # initial step
    newx = x + (alpha * pk)  # initial point
    newgrad = func(newx)[1]  # next gradient
    # LBFGS optimization loop
    for k in range(maxiter):
        # Compute search direction using L-BFGS formula
        q = newgrad
        alphaList = []
        for i in range(len(s_list) - 1, -1, -1):
            ai = rho[i] * np.dot(s_list[i].T, q)  # compute step size based on stored directions
            q -= ai * gx_list[i]  # subtract contribution of stored search direction from current
            alphaList.append(ai)  # store newest step size
        r = q / 1.  # normalize search direction
        z = alphaList[::-1]
        for i in range(len(s_list)):
            bi = rho[i] * np.dot(gx_list[i].T, r)  # compute step size based on stored grad diff
            r += s_list[i] * (z[i] - bi)  # add stored search direction to current

        # Update search history
        sk = newx - x  # new search direction
        yk = newgrad - gx  # new difference in gradient
        rho_k = 1 / np.dot(yk.T, sk)  # new step size
        if len(s_list) == m:  # if the number of stored search directions m is reached
            s_list.pop(0)  # remove the oldest search direction
            gx_list.pop(0)  # remove the oldest grad difference
            rho.pop(0)  # remove the oldest step size
        s_list.append(sk)  # store newest search direction
        gx_list.append(yk)  # store newest grad difference
        rho.append(rho_k)  # store newest step size

        # Perform line search
        p = -r  # new search direction
        newa = myArmijo(newx, func, p, 1e-4, 1, 0.5)  # determine new stepsize ak
        nfunc += 1

        # Update current point and gradient
        xk1 = newx + newa * p  # new point
        gk = newgrad  # update current grad
        newgrad = compute_hessian(func, xk1)  # new grad
        nfunc += 1

        # Check convergence
        if np.linalg.norm(gk) <= tol:
            break

        # Update point for next iteration
        x = newx  # old point is current point
        newx = xk1  # new point is calculated point
        gradnorm = np.linalg.norm(gk)  # calculate grad norm
    return newx, nfunc, gradnorm


# Test myLBFGS function
results = myLBFGS(x, func, tol)
print("Optimal point: ", results[0])
print("Number of function evaluations: ", results[1])
print("Gradient norm at optimal point: ", results[2])

"""
Polak-Ribiere Conjugate Gradient Method
inputs:
        x - starting point
        func - objective function
        tol - stopping criterion's tolerance for checking the norm of the gradient
    Outputs:
    newx - optimal solution of function f or point at which gradient is small enough
        nfunc - total number of evaluations of the objective function
        grad - norm of the gradient at newx
"""


def myPR(x, func, tol):
    global newx, nfunc, gradnorm
    maxiter = 1000  # Maximum number of iterations
    beta = 0.5  # Step size factor

    n = len(x)  # Number of variables
    grad = np.zeros(n)
    oldgrad = np.zeros(n)
    d = -func.gradient(x)

    # Iteration loop
    for i in range(maxiter):
        alpha = beta * np.dot(d, oldgrad - grad) / np.dot(d, d)
        # Take step
        newx = x + alpha * d
        # Compute function and gradient at new point
        nfunc = func(newx)
        grad = func.gradient(newx)
        # Compute norm of gradient
        gradnorm = np.linalg.norm(grad)
        # Check for convergence
        if gradnorm < tol:
            break
        # Update direction vector
        beta = np.dot(grad, grad - oldgrad) / np.dot(oldgrad, oldgrad)
        d = -grad + beta * d
        # Save old gradient
        oldgrad = grad
        # UpdAte x
        x = newx
    return newx, nfunc, gradnorm
