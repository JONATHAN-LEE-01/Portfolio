# Author: Jonathan Lee
# Title: Non-Linear Optimization Test Functions
# Date: April 5, 2023

"""
Evaluate the quadratic function: 
                                            0.5(x^T)Qx-(b^T)x 
for symmetric square matrix Q and some vector b. Needs to work for any dimensional problem, but it can assume the 
inputted objects x, Q, b are all appropriately shaped. It will output a scalar r and gradient g.
"""
import numpy as np

"""
Quadratic
    Input:
        x - column vector (LENGTH 2)
    Output:
        r - scalar
        g - gradient vector
"""
x = np.array([[0], [0]])
Q = np.array([[5,1],[1,1]])
b = np.array([[-1],[2]])
f = lambda x: myQuad(x, Q, b)

def myQuad(x, Q, b):
    fx = 0.5*np.dot(x.T, np.dot(Q, x))- np.dot(b.T,x)
    gx = np.dot(Q, x) - b
    return fx, gx

# myQuad Output:
[fx, gx] = myQuad(x, Q, b)
print("myQuad Test Output:")
print("r =", fx)
print("g =", gx)
