### Dynamic Programming II: Text Justification, Blackjack

#### 5 "easy" steps to DP

1. define subprob
2. guess(part of solution)
3. relate subprob solution (recurrence)
4. recurse & memoize or build DP table bottom-up
   - acyclic
   - topo order
   - time = #subprobs•time per subprob
5. solve original problem?

[Note](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/MIT6_006F11_lec20.pdf)

#### Text justification

- split text into "good" lines
- text = list of words
- badness(i-j): how bad it is as words[i:j] fit a line  
  if don't fit => infinity  
  otherwise (page width - total width)<sup>3</sup>  
- Goal is to have a least sum of badness
  1. subprob: suffixes words[ i : ]  
     #subprobs: n
  2. guess: where to start 2nd line  
     #choices ≤ n-i = O(n)
  3. recurrence: DP(i) which is the solution of the subprob with suffixes of words{i:}   
     min(DP(i) = badness(i,j) + DP(j) for j in range(i+1,n+1))  
  4. topological order  
     i = n, n-1,...,0  
     total time: O(n<sup>2</sup>)
  5. if original prob solved: DP(0)

#### Parent pointers

remember which guess was best

parent[i] = argmin(...) = j value  
0 -> parent[0] -> parent(parent(0))......

#### Blackjack

##### Perfect-information

deck: C<sub>0</sub>,C<sub>1</sub>,...,C<sub>n-1</sub>  
player vs dealer  
$1 bet/hand

1. subprob: suffix C<sub>i:</sub>  
   num of subprobs: n
2. guess: how many hits are left?  
   #choices < n
3. recurrence:  
   BJ(i) = max(  
   outcome∈{-1,0,1}  
   + BJ(j)  where j = i + 4 + #hits + #dealerhits  
     for #ofHits in range(0,n)  
     if valid play

