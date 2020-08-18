### Bellman-Ford

#### Generic S.P. Algo review

1. Complexity could be exponential time (even for +ve weights)
2. might not even terminate if there is a -ve weight cycle reachable from the source

#### Bellman-Ford(G,W,s) to solve prob 2 above

```
Initialize()
for i=1 to |v|-1
	for each edge(u,v)∈E
		Relax(u,v,w)
	for each edge(u,v)∈E
		if d[v] > d[u] + w(u,v)
			then report -ve cycle exists
```

- O(VE)
- Correctness
  - Theorem: If G = (V,E) contains no -ve weight cycles then after B-F executes, d[v] = ẟ[s,v] for all v∈V
  - Corollary: If a value d[v] fails to converge after |v|-1 passes, there exists a -ve weight cycle reachable from s
  - Proof by induction
    - [Proof](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/MIT6_006F11_lec17.pdf)

##### Notice

B-F algo doesn't sovle the -ve cycle but give an option to abort for the sake of termination  
It gives the option of aborting and keep the algo complexity away from exponential time (NP-Hard Prob)

[B-F Explanation](https://www.youtube.com/watch?v=9PHkk0UavIM)

