# Create an Adaline Network for OR function with bipolar inputs and targets
import numpy as np
from prettytable import PrettyTable
x = PrettyTable()
x.field_names = ["Epoch", "x1", "x2", "1", "t", "yin", "(t-yin)", "w1", "w2", "b", "Error = (t-yin)^2"]

# input data
X = np.array([[1, 1], [1, -1], [-1, 1], [-1, -1]])

# output data
y = np.array([-1, 1, -1, -1])

# initialize weights
w = np.array([0.1, 0.1])
b = 0.1
# learning rate
alpha = 0.1

# number of epochs
epochs = 2

# training
for epoch in range(epochs):
    for i in range(len(X)):
        # calculate output
        y_hat = np.dot(X[i], w) + b
        # update weights
        w = w + alpha * (y[i] - y_hat) * X[i]
        b = b + alpha * (y[i] - y_hat)
        # print output in 2 decimal precision
        x.add_row([epoch, X[i][0], X[i][1], 1, y[i], round(y_hat, 3), round(
            y[i] - y_hat, 3), round(w[0], 3), round(w[1], 3), round(b, 3), round((y[i] - y_hat)**2, 3)])

# test
print("\n################################### Test Adaline Network ###################################\n")
print(x)
