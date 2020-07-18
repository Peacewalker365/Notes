py


**Tuple**
immutable


**List**
mutable

**Dictionary**
Keys must be unique.
Keys must be hashable! For now, you can think as those immutable types(int, float, string, tuple, bool).



**try:**
**except:**
**else:**
**finally:**

try:
a = int(input("Tell me one number:"))
b = int(input("Tell me another number:"))
print(a/b)
except:
print("Bug in user input.")
 exceptions raised by any statement in body of try are handled by the except statement and execution continues with the body of the except statement

try:
a = int(input("Tell me one number: "))
b = int(input("Tell me another number: "))
print("a/b = ", a/b)
print("a+b = ", a+b)
except ValueError:
print("Could not convert to a number.")
except ZeroDivisionError:
print("Can't divide by zero")
except:
print("Something went very wrong.")

else:
• body of this is executed when the execution of the associated try body completes with no exceptions
 finally:
• body of this is always executed after try, else and
except for clauses, even if they raised another error or executed a break, continue or return
• useful for clean-up code that should be run no matter
what else happened (e.g. close a file)


**Signal Error Condition**
raise exceptionName (arguments)
raise ValueError ("somthing is wrong")


def get_ratios(L1, L2):
""" Assumes: L1 and L2 are lists of equal length of numbers
Returns: a list containing L1[i]/L2[i] """
ratios = []
for index in range(len(L1)):
try:
ratios.append(L1[index]/L2[index])
except ZeroDivisionError:
ratios.append(float('nan')) #nan = not a number
except:
raise ValueError('get_ratios called with bad arg')
return ratios


**Assertions**
assert condition, 'something here'
assert len(grades) != 0, 'no grades data'
The function ends immediately if the assertion not met. So, it's a perfect way to locate the bug.
raises an AssertionError if it is given an empty list for grades, otherwise runs ok.


It's a good method of defensive programming.


 the goal is to spot bugs as soon as introduced and make
clear where they happened
 use as a supplement to testing
 raise exceptions if users supplies bad data input
**use assertions to**
• check types of arguments or values
• check that invariants on data structures are met
• check constraints on return values
check for violations of constraints on the procedure (e.g. no duplicates in a list)


**Function**
def name(parameters):


**Class and Method**
class Name(classParent):

class Coordinate(object):
    def __init__(self, x = 0, y = 0):
        self.x = x
        self.y = y
    def distance(self, other):
        x_diff_sq = (self.x-other.x)**2
        y_diff_sq = (self.y-other.y)**2
        return (x_diff_sq + y_diff_sq)**0.5
    def __str__(self):
        return "<"+str(self.x)+","+str(self.y)+">"


print(c.distance(zero)) is equivalent to print(Coordinate.distance(c, zero))



data attributes of an instance are called instance variables
 don’t provide an argument for self, Python does this automatically
 Procedural attribute, like a function that works only with this class
 Python always passes the object as the first argument
• convention is to use self as the name of the first argument of all methods



**isinstance()**
to check if an object is a Coordinate
print(isinstance(c, Coordinate))


**Special Method**
like print, can override these to work with your class
define them with double underscores before/after
__add__(self, other) ---> self + other
__sub__(self, other) ---> self - other
__eq__(self, other) --->self == other
__lt__(self, other) ---> self < other
__len__(self) ---> len(self)
__str__(self) ---> print self
... and others


**OOP**
 bundle together objects that share
• common attributes and
• procedures that operate on those attributes
 use abstraction to make a distinction between how to implement an object vs how to use the object
 build layers of object abstractions that inherit behaviors from other classes of objects
 create our own classes of objects on top of Python’s basic classes


**Class Variable**

It will not be initialized for objects but shared among all objects.

class Rabbit(Animal):
tag = 1
def __init__(self, age, parent1=None, parent2=None):
Animal.__init__(self, age)
self.parent1 = parent1
self.parent2 = parent2
self.rid = Rabbit.tag
Rabbit.tag += 1
def get_rid(self):
return str(self.rid).zfill(3)
def get_parent1(self):
return self.parent1
def get_parent2(self):
return self.parent2

def __add__(self, other):
'''returning object of the same type as this class
return Rabbit(0, self, other)'''

def __eq__(self, other):
parents_same = self.parent1.rid == other.parent1.rid \
and self.parent2.rid == other.parent2.rid
parents_opposite = self.parent2.rid == other.parent1.rid \
and self.parent1.rid == other.parent2.rid
return parents_same or parents_opposite



**Program Efficiency**
Big O

O(1)	denotes constant running time
O(logn) denotes logarithmic running time	
O(n)	denotes linear running time	
O(nlogn)	denotes log-linear running time	
O(n^c) denotes polynomial running time(c is a constant)	
O(c^n) denotes exponential running time(c is a constant being raised to a power based on the size of the input)









