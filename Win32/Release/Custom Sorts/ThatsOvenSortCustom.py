from random import randrange
from time import time
from Sorting_Module import * #Grab stuff we need
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
            Delphi_Form.cHappened(a[counter],counter)
            if int(a[counter]) == counter:
                a[counter] = [a[counter]]
            else:
                if type(a[a[counter]]) is list:
                    a[a[counter]].append(a[counter])
                    a[counter] = []
                else:
                    temp = int(a[a[counter]])
                    a[a[counter]] = [a[counter]]
                    a[counter] = temp
            listcount += 1
    size = len(a)
    counter = 0
    for i in range(size):
        l = len(a[counter])
        if l == 0:
            a.remove(a[counter])
            size -= 1
            #print(inputa)
        elif l == 1:
            a[counter] = a[counter][0]
            counter += 1
           # print(inputa)
        else:
            temp = a[counter].copy()
            a.remove(a[counter])
                #print(inputa)
#print(inputa)
thatsOvens_staticSort(array)

#print(inputa)
#print("thatsOven's staticSort, Elapsed time: " + fin + ' s (' + str(float(fin) * 1000) + ' ms)')
#print('Quantity of numbers: ' + str(len(inputa)) + ' , Maximum number: ' + str(max(inputa)))
#input()

from Sorting_Module import * #Grab stuff we need
# ("array") Refers to the array that needs to be sorted
#Delphi_Form.sHappened(iSwap1,iSwap2) Use this when 2 values are swapped
#Delphi_Form.cHappened(iCompare1,iComapare2) use this when 2 values are compared