### Dijkstra (also check A* algo)

#### Relax(u,v,w)

```
Relax(u,v,w)
	if d[v] > d[u] + w(u,v)
	d[v] = d[u] + w(u,v)
	𝜋[v] = u   //predecessor relationship
```

#### Safety

Lemma: The relaxation operation maintains the invariance that d[v] ≥ 𝛿(S,v) for all v∈V

Proof: By induction on the number of steps

- d[u] ≥ 𝛿(S,u)
- 𝛿(S,v) ≤ 𝛿(S,u) + 𝛿(u,v)
- 𝛿(S,v) ≤ d[u] + w(u,v)

#### DAGs (Directed Acyclic Graphs)

- NO -ve cycles
- Topological sort the DAG. Path from u to v implies that u is before v in the ordering.
- One pass over vertices in topological sorted order relaxing each edge that leaves each vertex.
- O(V+E)

##### Demo

- [demo](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/MIT6_006F11_lec16.pdf)

#### Dijkstra(G,W,s)

```
Initialize(G,s): d[s] = 0 
S <- φ   Q <- V where Q is a priority queue sorted by d value
	while Q ≠ φ
		u <- EXTRACT-MIN(Q) //delete u from Q
		S <- S U {u}
		for each vertex v ∈ Adj[u]
			relax(u,v,w)
```

- [explanation](https://www.youtube.com/watch?v=GazC3A4OQTE)
- [A* algo](https://www.youtube.com/watch?v=ySN5Wnu88nE&t=340s)
- Complexity
  - Θ(V) insert into the priority queue
  - Θ(V) extract-min ops
  - Θ(E) decrease-key ops
  - Array:
    - Θ(V)
    - Θ(V)
    - Θ(1)
    - Θ(V•V + E•1) = Θ(V<sup>2</sup>)
  - Binary min-heap
    - Θ(V)
    - Θ(lgV)
    - Θ(lgV)
    - Θ(VlgV + ElgV)
      - if we use Fibonacci heap (amortized data structure): Θ(VlgV + E)
        - Θ(V)
        - Θ(lgV)
        - Θ(1)