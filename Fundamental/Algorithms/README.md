**Bisection Search**


def bisect_search1(L, e):

 if L == []:

 return False

 elif len(L) == 1:

 return L[0] == e

 else:

 half = len(L)//2

 if L[half] > e:

 return bisect_search1( L[:half], e)

 else:

 return bisect_search1( L[half:], e)




O(nlgn) for this one

It takes lgn steps until the len(L) is 1.

In every step, it takes O(n) to copy a list.



Revision aiming to achieve O(lgn)

def bisect_search2(L, e):

 def bisect_search_helper(L, e, low, high):

 if high == low:

 return L[low] == e

 mid = (low + high)//2

 if L[mid] == e:

 return True

 elif L[mid] > e:

 if low == mid: #nothing left to search

 return False

 else:

 return bisect_search_helper(L, e, low, mid - 1)

 else:

 return bisect_search_helper(L, e, mid + 1, high)

 if len(L) == 0:

 return False

 else:

 return bisect_search_helper(L, e, 0, len(L) - 1)







**Program Efficiency**

Big O



O(1)	denotes constant running time

O(logn) denotes logarithmic running time	

O(n)	denotes linear running time	

O(nlogn)	denotes log-linear running time	

O(n^c) denotes polynomial running time(c is a constant)	

O(c^n) denotes exponential running time(c is a constant being raised to a power based on the size of the input)










