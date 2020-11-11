from Sorting_Module import * #Grab stuff we need

# ('array') Refers to the array that needs to be sorted
        #The 2 following procedures are for tracking in the scoreboard
#Delphi_Form.sHappened (iSwap1,iSwap2) Use this when 2 values are swapped
#Delphi_Form.cHappened (iCompare1,iComapare2) use this when 2 values are compared
  
def bubbleSort(arr): 
    n = len(arr)
    for i in range(n): 
  
        for j in range(0, n-i-1): 

            Delphi_Form.cHappened(arr[j],arr[j+1])
            if arr[j] > arr[j+1]:
                Delphi_Form.sHappened(arr[j],arr[j+1])
                arr[j], arr[j+1] = arr[j+1], arr[j] 


bubbleSort(array)
