import numpy as np
l = list(np.recfromtxt('input.txt'))

# question 1
for i in l:
    for j in l:
        if i + j == 2020:
            print(i*j)


# question 2 
for i in l:
    for j in l: 
        for k in l: 
            if i + j + k == 2020: 
                print(i*j*k)