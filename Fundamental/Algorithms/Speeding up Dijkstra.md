### Speeding up Dijkstra

#### Optimize Dijkstra

##### Single-Source, single target: s -> t

```
Initialize()   where d[s] = 0  d[u≠s] = ∞
Q <- V[a]
while Q ≠ 𝜑
	do u <- EXTRACT-MIN(Q)
	for each vertex v∈Adj[u]
		do Relax(u,v,w)
```

you can add (stop if u == t) rather than quit until Q is null to accelerate it

#### Bi-Directional Search

Alternate forward search from s and backward search from t, and we sorts of doubles all the data structures, like we have Qf and Qb, df[u] and db[u] ...

##### what is the termination condition?

- some vertex u has been processed both in the forward search and backward search

How do we find the shortest path from s to e?

- claim: If w was processed first from both Qf, Qb  
  find S.P. using πf from s to w  
  find S.P. using πb from t to w (backward)
  - but the answer will be the shortest length path and may not be the shortest weight path

How to fix it?

- **find an x (possibly diff from w) that has minimum value of df[x] + db[x]**

#### Goal-Directed Search: Potentials, Landmarks (or A*)

-modify edge weights with potential functions  
W(u,v) = w(u,v) - 𝜆(u) + 𝜆(v)

- correctness
  - W(p) = w(p) - 𝜆t(s) + 𝜆t(t)
- [landmark](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/MIT6_006F11_lec18.pdf)





