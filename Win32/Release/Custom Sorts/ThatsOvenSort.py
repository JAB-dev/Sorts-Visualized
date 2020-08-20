from random import randrange
from time import time
inputa = []
number_quantity = 100
maximum_number = 100
f = open("Sort.txt", "r")
for x in f:
    inputa.append(int(x))
#for i in range(number_quantity):
#   inputa.append(randrange(0, int(maximum_number), 1))
def thatsOvens_staticSort(a):
    M = max(a)
    size = len(a)
    if M > (size - 1):
        for i in range(M - size + 1):
            a.append([])
    if M == size:
        a.insert(0, [])
    counter = 0
    listcount = 0
    while listcount < size:
        if type(a[counter]) is list:
            counter += 1
        else:
            if int(a[counter]) == counter:
                a[counter] = [a[counter]]
            else:
                if type(a[a[counter]]) is list:
                    a[a[counter]].append(a[counter])
                    a[counter] = []
                    #print(inputa)
                    f = open("Sorted.txt", "a")
                    f.write(str(inputa)+"\n")
                    f.close()
                else:
                    temp = int(a[a[counter]])
                    a[a[counter]] = [a[counter]]
                    a[counter] = temp
                   # print(inputa)#we need to output on each change
                    f = open("Sorted.txt", "a")
                    f.write(str(inputa)+"\n")
                    f.close()
            listcount += 1
    size = len(a)
    counter = 0
    for i in range(size):
        l = len(a[counter])
        if l == 0:
            a.remove(a[counter])
            size -= 1
            #print(inputa)
            f = open("Sorted.txt", "a")
            f.write(str(inputa)+"\n")
            f.close()
        elif l == 1:
            a[counter] = a[counter][0]
            counter += 1
           # print(inputa)
            f = open("Sorted.txt", "a")
            f.write(str(inputa)+"\n")
            f.close()
        else:
            temp = a[counter].copy()
            a.remove(a[counter])
            for j in range(len(temp)):
                a.insert(counter, temp[j])
                counter += 1
                #print(inputa)
                f = open("Sorted.txt", "a")
                f.write(str(inputa)+"\n")
                f.close()
#print(inputa)
startime = time()
thatsOvens_staticSort(inputa)
fin = str(time() - startime)
f = open("Sorted.txt", "a")
f.write(str(inputa))
f.close()
#print(inputa)
#print("thatsOven's staticSort, Elapsed time: " + fin + ' s (' + str(float(fin) * 1000) + ' ms)')
#print('Quantity of numbers: ' + str(len(inputa)) + ' , Maximum number: ' + str(max(inputa)))
#input()
