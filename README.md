# Sorts-Visualized


Built by JAB

Features as of 2020/08/22:

ThatsOven providing first python sort♥

Vermenthruaxx for the joke table flip sort♥

Rainbow Display bar graph with a rainbow repeating every 25 elements

Support for Custom Python Sorts

Several built in sorts including but not limited to bubble,comb,quick

Support for changing Array Length

Support for changing delays (delays work differently on different sorts,Swap delay becomes read delay with python sorts)

Multiple input styles (Different graphs and such)

Sound support for built in sorts

Support for changing array Length

Timer support not really useful since you add delay anyway, so currently not in use

Executable is located inside of Win32>Release(Or debug, debug is likely to be newer)>JABsVisualSorts.exe

xxxHOW TO MAKE A CUSTOM SORT OLD METHODxxx

Whilst I am no expert in python here is what your sort needs to work

Place the py file in Sorts-Visualized\Win32\Release\Custom Sorts

Your sort needs to get the input array from a file called Sort.txt

Something like this:

    f = open("Sort.txt", "r")
    for x in f:
        inputa.append(int(x))

Since each number is on a new line

And everytime you make a change to the array use:

    f = open("Sorted.txt", "a")
    f.write(str(inputa)+"\n")
    f.close()

Everything else is handled by the visualizer 
