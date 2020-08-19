### Dynamic Programming I: Fibonacci, Shortest Paths

#### Dynamic programming (DP)

- DP ≈ careful brute force
- DP ≈ guessing + recurrsion + memoization
- time = #subprobs • time of each subprob (treating recurrsive calls as Θ(1) since we only pay it on the first call)

#### Fibonacci numbers

```
fib(n):
	if n≤2: f=1
	else: f=fib(n-1)+fib(n-2)
	return f
```

T(n) = T(n-1) + T(n-2) + c ≥ 2T(n-2) = Θ(2<sup>n/2</sup>)

##### Memoized DP algo

```
memo = {}
fib(n):
	if n in memo: return memo[n]
	if n ≤ 2: f=1
	else: f=fib(n-1)+fib(n-2)
	memo[n]=f
	return f
```

fib(k) only recurses the first time it's called, any k

memoized calls cost Θ(1)

num of memo is n

nonrecursive work per call is Θ(1) => Θ(n) in total

SO DP:  
memoize (remember) and re-use solutions to subproblems that help solve the problem => time = # of subprobs•time/subprobs•Θ(1)

##### Bottom-up DP algo

```
fib = {}
for k in range(1,n+1):
	if k≤2: f=1
	else: f=fib[k-1]+fib[k-2]
	fib[k]=f
return fib[n]
```

This is more efficient since there is no recursive function calls

- exactly same computation
- topological sort of subproblem dependency DAG
- often save some space, i.e. in this case we can keep only the latest 2 results

#### Shortest Paths

##### Guessing

- if don't know the answer, guess

- try all guesses and then take the best one

- ```
  Guess from the last vertex for all the incoming edges
  traversal
  ẟ(s,v) = min(ẟ(s,u) + w(u,v))
  this is a recursive call and it's very bad as exponential
  of course we will use memo to improve it a little
  ```

  - But it might be falling in infinite time loop with cycles! => **subprobs should be acyclic** which may be DAG

  - For DAGs: O(V+E)

    - time for subprob ẟ(s,v) = indegree(v)  
      total time = sum of indegree(v) = O(V+E)

  - If we have +ve cycles

    - ẟ(s,v) = shortest weight of path s->v that uses ≤k edges
    - ẟ<sub>k</sub>(s,v) = (ẟ<sub>k-1</sub>(s,v) + w(u,v))
    - num of subprobs = V<sup>2</sup>
    - [explanation](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/MIT6_006F11_lec19.pdf)

    