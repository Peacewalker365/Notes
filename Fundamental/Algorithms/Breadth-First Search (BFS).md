### Breadth-First Search (BFS)

#### Basic Graph Review

##### Graph search

- find paths from one state to another



##### Recall: graph G = (V,E)

- V = set of vertices
- E = set of edges
  - undirected e = {v,w} unordered pairs
  - directed e = (v,w) ordered pairs

##### Aplications of graph search

- web crawling
- social networking (search the friend near you than friends of a friend)
- network broadcast
- garbage collection
- model checking
- check mathematical conj.
- solving puzzle of game

##### Pocket Cube: 2x2x2

- configuration graph
  - vertex for each possible state of cube
  - number of vertices: 8! x 3<sup>8</sup> = 264,539,520
    - on every cube there are 8 vertices that can be permulated inside itself
    - then every cube has 3 rotation state
    - there are 8 cubes in total
    - you can actually divide it by 24 since there are 24 symmetries
    - you also can divide it by 3 since only one third of the cofiguration spaces are reachable 
  - edge for each possible move
    - ​	undirected
  - solved state -> next possible states ->...->initial states
    - the number of layers is called the diameter
    - for the best algo, the worst case is 11
      - for 3x3x3 it's 20
      - for nxnxn Θ(n<sup>2</sup>/lgn)

#### Graph Representation

##### Adjacency lists

- array Adj of |V|
- linked lists
- for each vertex u∈V, Adj[u] stores u's neighbors, which can be reached in one step
- object oriented:  
  v.neighbors = Adj[v]
- implicit representation:  
  Adj(u) is a function  
  or v.neighbors() is  method of the class
- Θ(V+E)

#### BFS

- goal: visit all nodes reachable from given s∈V  
  O(V+E) time  

- look at the nodes reachable in 0 moves, 1 moves,...

- careful to avoid duplicates

- ```python
  BFS(s,Adj):
  	level = {s: φ}
  	parent = {s: None}
  	i = 1
  	frontier = [s] #<- frontier is the set of nodes reached in prev level, which is level i-1
  	while frontier:
  		next = []
  		for u in frontier:
  			for v in Adj[u]:
  				if v not in level:
  					level[v] = i
  					parent[v] = u
  					next.append(v)
       frontier = next
       i+=1
       
  ```

#### Shortest Path 

- if we take v  
  parent[v]  
  parent[parent[v]]  
  ...  
  until we get s
- we just find a shortest path from s to v
- the length will be the level of v

