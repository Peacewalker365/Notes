### Integer Arithmetic, Karatsuba Multiplication

#### Irrationals

#### Catalan numbers (cardinality of the set)
- Set P of balanced parentheses strings
	- 𝜆 ∈ P (𝜆 is the empty string)
	- if 𝛂,𝛃 ∈ P, then (𝛂)𝛃 ∈ P
	- we can get every nonempty balanced paren string via Rule 2 from unique 𝛂,𝛃 pair
	  - (())()() obtained by 𝛂=() 𝛃=()()
	- Enumeration
	  - C<sub>n</sub>: number of balanced paren strings with exactly n pairs of parens
	  - C<sub>0</sub> = 1 as the base case (empty string)
	  - C<sub>1</sub> = 1
	  - C<sub>2</sub> = C<sub>0</sub>C<sub>1</sub> + C<sub>1</sub>C<sub>0</sub> = 2
	  - C<sub>n+1</sub> = ∑C<sub>k</sub>C<sub>n-k</sub>    n ≥ 0  from k = 0 to n

#### Newton's Method

- say you have y = f(x) and we want to find root of f(x) = 0 through successive approx
- f(x) = x<sup>2</sup> - a
- [Explaination]([https://amsi.org.au/ESA_Senior_Years/SeniorTopic3/3j/3j_2content_2.html#:~:text=Finding%20a%20solution%20with%20geometry,requires%20calculus%2C%20in%20particular%20differentiation.](https://amsi.org.au/ESA_Senior_Years/SeniorTopic3/3j/3j_2content_2.html#:~:text=Finding a solution with geometry,requires calculus%2C in particular differentiation.))
- **x<sub>i+1</sub> = x<sub>i</sub> - f(x<sub>i</sub>)/f '(x<sub>i</sub>)**
- for this case:  
  **x<sub>i+1</sub> = x<sub>i</sub> - (x<sub>i</sub><sup>2</sup> - a) / 2x<sub>i</sub> = (x<sub>i</sub> + a/x<sub>i</sub>) / 2**
- if we implement it on x<sup>2</sup> = 2  
  x<sub>0</sub> = 1.000000000...  
  x<sub>1</sub> = 1.<u>5</u>00000000...  
  x<sub>2</sub> = 1.<u>41</u>6666666...  
  x<sub>3</sub> = 1.<u>4142</u>15686...  
  x<sub>4</sub> = 1.<u>41421356</u>2...  
  **Quadratic convergence!**  
  **The accurate digits doubles in every iteration**
- So now it's not a too bad thing for getting a million accurate digits since the exponential change will help us getting there in reasonable time

#### sqrt(2) to d-digit precision

- we want integer floor(10<sup>d</sup>sqrt(2)) == floor(sqrt(2•10<sup>2d</sup>))
- still use Newton's Method

##### High Precision Multiplication

- two n-digit numbers (radix r = 2, 10)  
  0 ≤ x, y ≤ r<sup>n</sup>
- Divide and Conquer   
  x = x<sub>1</sub> • r<sup>n/2</sup> + x<sub>0</sub>   where x<sub>1</sub> is the high half and x<sub>0</sub> is the low half  
  0 ≤ x<sub>0</sub>,x<sub>1</sub> ≤ r<sup>n/2</sup>  
  Do the same to y  
  Then do it recursively
- here is how we do the multiplication  
  z = xy = x<sub>1</sub>y<sub>1</sub>r<sup>n</sup> + (x<sub>0</sub>y<sub>1</sub> + x<sub>1</sub>y<sub>0</sub>)r<sup>n/2</sup> + x<sub>0</sub>y<sub>0</sub>  
  4 multiplication of n/2 digit numbers => Θ(n<sup>2</sup>) time  
  T(n) = 4T(n/2) + Θ(n)   we assume the addition takes linear time
- We want to do better

##### Karatsuba Multiplication

- let z<sub>0</sub> = x<sub>0</sub>y<sub>0</sub>  
  let z<sub>2</sub> = x<sub>2</sub>y<sub>2</sub>  
  let z<sub>1</sub> = (x<sub>0</sub> + x<sub>1</sub>)(y<sub>0</sub> + y<sub>1</sub>) - z<sub>0</sub> - z<sub>2</sub>  
  T(n) = 3T(n/2) + Θ(n)  
  => Θ(n<sup>log<sub>2</sub><sup>3</sup></sup>) = Θ(n<sup>1.58</sup>)
- then what about optimize it even more  
  i.e. breaking up this to more chunks, say 3 parts  
  then we have 9 multiplications  
  so we can try to play with it to shrink the times of multiplications down to a small number

##### Fun Geometry Problem

- a circle with r = 1 trillion units
- we have CA and CB where C is the center and A,B are two points on the circle
- now from B we make a line down perpendicular to CA with a intersection of D
- What is AD?
- AD = AC - CD = sqrt((0.5trillion)<sup>2</sup> - 1)
- WoW, we can see all the Catalan numbers in the answer!