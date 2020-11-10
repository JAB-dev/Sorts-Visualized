# Python program for implementation of Radix Sort
from Sorting_Module import * #Grab stuff we need
# A function to do counting sort of arr[] according to
# the digit represented by exp.
def countingSort(arr, exp1):

	n = len(arr)

	# The output array elements that will have sorted arr
	output = [0] * (n)

	# initialize count array as 0
	count = [0] * (10)

	# Store count of occurrences in count[]
	for i in range(0, n):
		index = (arr[i]/exp1)
		count[ int(index)%10 ] += 1

	# Change count[i] so that count[i] now contains actual
	# position of this digit in output array
	for i in range(1,10):
		count[i] += count[i-1]

	# Build the output array
	i = n-1
	while i>=0:
		index = (arr[i]/exp1)
		output[ count[ int(index)%10 ] - 1] = arr[i]
		count[ int(index)%10 ] -= 1
		i -= 1

	# Copying the output array to arr[],
	# so that arr now contains sorted numbers
	i = 0
	for i in range(0,len(arr)):
            arr[i] = output[i]

# Method to do Radix Sort
def radixSort(arr):

	# Find the maximum number to know number of digits
	max1 = max(arr)

	# Do counting sort for every digit. Note that instead
	# of passing digit number, exp is passed. exp is 10^i
	# where i is current digit number
	exp = 1
	while max1/exp > 0:
            #f = open("Sorted.txt", "a")
           # f.write(str(inputa)+"\n")
          #  f.close()
            countingSort(arr,exp)
            exp *= 10
# Driver code to test above

radixSort(array)

# This code is contributed by Mohit Kumra


# ("array") Refers to the array that needs to be sorted
#Delphi_Form.sHappened(iSwap1,iSwap2) Use this when 2 values are swapped
#Delphi_Form.cHappened(iCompare1,iComapare2) use this when 2 values are compared