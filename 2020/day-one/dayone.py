import numpy as np
l = list(np.recfromtxt('input.txt'))

# question 1 
def q1(l): 
    for i in l:
        for j in l:
            if i + j == 2020:
                print(i*j)
                return
q1(l) 

# question 2
def q2(l):  
    for i in l:
        for j in l: 
            for k in l: 
                if i + j + k == 2020: 
                    print(i*j*k)
                    return
q2(l)

### more efficient solution ### 
def q1Efficient(l):
    remainingMap = {}
    for i in l:
        remainingMap[2020 - i] = i
    for i in l:
        if i in remainingMap:
            print(remainingMap[i] * i)
            break
q1Efficient(l)
