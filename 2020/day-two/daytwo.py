with open('input.txt') as f:
    l = f.read().splitlines()

# question  1
total = 0
for line in l:
    parts = line.split()
    lower = int(parts[0].split('-')[0])
    upper = int(parts[0].split('-')[1])
    letter = parts[1][0]
    st = parts[2]
    letter = st.count(letter)
    if letter < lower or letter > upper:
        total+= 1

print(1000-total)



# question 2 
total = 0
for line in l:
    parts = line.split()
    first_position = int(parts[0].split('-')[0])
    second_position = int(parts[0].split('-')[1])
    letter = parts[1][0]
    st = parts[2]

    cond_one = st[first_position-1] == letter
    cond_two = st[second_position-1] == letter
    if cond_one + cond_two == 1:
        total+=1
print(total)