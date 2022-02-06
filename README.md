# Sorts-Visualized

# Requirements
Python

# Usage

![image](https://user-images.githubusercontent.com/68183649/152675275-ebbe38c3-b41f-47ff-9df6-f94072db0241.png)

1. Select sort
2. Select input
3. Sort




Features as of 2020/08/22:

Multiple graph styles

Support for Custom Python Sorts

Several built in sorts including but not limited to bubble,comb,quick

Support for changing Array Length

Support for changing delays (delays work differently on different sorts,Swap delay becomes read delay with python sorts)

Multiple input styles

Sound support for built in sorts

Support for changing array Length

Support for multiple files for custom sounds, you could sort with the sounds of the lord of rings trilogy if you so desire

# Other

Executable is located inside of Win32>Release(Or debug, debug is likely to be newer)>JABsVisualSorts.exe

xxxHOW TO MAKE A CUSTOM SORTxxx

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
