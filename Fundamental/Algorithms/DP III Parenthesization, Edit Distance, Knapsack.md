### DP III: Parenthesization, Edit Distance, Knapsack

#### Subprblem for strings/sequences

- suffixes x[i:] for any i   Θ(n)
- prefixes x[:i] for any i   Θ(n)
- substrings x[i:j] for all i ≤ j   Θ(n<sup>2</sup>)

#### Parenthesization

- optimal evaluation of associative expression  
  A<sub>0</sub>•A<sub>1</sub>•...•A<sub>n-1</sub>  
  how to put the parenthesis
- [note](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/MIT6_006F11_lec21.pdf)

1. subprob: the optimal evaluation of A<sub>i</sub> to A<sub>j-1</sub> which is i:j  
   #subprobs = Θ(n<sup>2</sup>)
2. guess: outermost/last multiplication  
   (A<sub>i</sub>...A<sub>k-1</sub>)•(A<sub>k</sub>...A<sub>j-1</sub>)  
   #choices = O(j-i+1) = O(n)  
3. recurrence  
   DP[i:j] = min(  
   DP(i,k) + DP(k,j) + cost of (A<sub>i</sub>...A<sub>k-1</sub>)•(A<sub>k</sub>...A<sub>j-1</sub>)  
   for k in range(i+1,j)  
   )  
   time per subprob = O(n)
4. time = Θ(n<sup>3</sup>)  
   topological order: increasing substring size

#### Edit distance

given two string x&y, what's the cheapest possible sequence of character edits to turn x->y  
where we allow to insert, delete, replace as character edits

- longest common subsequence

  - **H**I**E**ROG**L**YPHO**LO**GY  
    MIC**H**A**EL**ANGE**LO**
  - cost of insert/delete = 1  
    cost of replace c->c' = if c=c' 𝜑 else ∞

  1. subprob = edit distance on x[i:] & y[j:] 

     - $subprobs = Θ(|x|•|y|)

  2. guess  
     one of 3 possibilities ∈ {insert,delete,replace}

  3. recurrence  
     DP(i,j) = min(  
     cost of replace x[i] -> y[j]   

     \+ DP(i+1,j+1), cost of insert y[j] + DP(i,j+1), cost of delete x[i] + DP(i+1,j)  
     )

  4. topological order  
     for i = |x|,...,0  
         for j = |y|,...,0  
     you can see this in a form of matrix

  5. DP(0,0)  
     Θ(1) per subprob  
     time=Θ(|x|•|y|)

#### Knapsack

- list of items  
  each with size s<sub>i</sub> -> integer  
                    value v<sub>i</sub> -> integer
- Knapsack of size S
- max sum of values of total size ≤ S

1. subprob = suffix i: of items & remaining capacity X ≤ S  
   \#subprobs = (n•S)  
2. guessing: is item i in subset or not
3. DP(i,X) = max(DP(i+1,X), DP(i+1,X-s<sub>i</sub>) + v<sub>i</sub> )
4. time = Θ(n•S)  
   not polynomial time  
   since if input(size, value) is huge, the input will be Θ(nlgS) since it takes lgS bits to contain it  
   but is S is small it's fine  
   pseudopolynomial time