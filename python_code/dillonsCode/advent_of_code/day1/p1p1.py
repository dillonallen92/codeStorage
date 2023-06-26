
elfArr = []

with open('p1p1.txt','r') as f:
    for line in f.readlines():
        if line == '\n':
            print("----")
        else:
            print(int(line))
