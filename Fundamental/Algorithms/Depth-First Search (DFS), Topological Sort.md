### Depth-First Search (DFS), Topological Sort

#### DFS

- recursively explore graph, backtracking as necessary

- ```python
  parent = {s: None}
  DFS-Visit(Adj,s):
    for v in Adj[s]:
      if v not in parent:
        parent[v] = s
        DFS-Visit(Adj,v)
  ```

- ```python
  DFS(V,adj):
    parent = {}
    for s in V:
      if s not in parent:
        parent[s] = None
        DFS-Visit(Adj,s)
  ```

- Analysis

  - O(V+E) time
    - visit each vertex once in DFS alone O(V)
    - DFS-Visit(v) called once per vertex v  
      pay |Adj[v]| => O(sum of all |Adj(v)| in V) = O(E)

##### Edge classification

- tree edge (parent pointers)  
  visit new vertex via edge
- forward edge: node -> descendant in tree
- backward edge: node -> ancestor in tree
- cross edge: between two non-ancestor-related subtrees
- Notice: in undirected graph, only tree edge and backward edge exsit

#### Cycle detection

- G has a cycle <=> DFS has a back edge  
  proof in both directions

#### Topological Sort

##### Job scheduling 

- given directed acyclic graph(DAG), order vertices so that all edges point from low order to high order
- topological sort: using DFS
  - output reverse of finishing times of vertices
  - Correctness: we wanna make sure, for any edge e:(u,v)  
    v finishes before u finishes
    - Case 1: u starts before v  
      visit v before finishing u
    - Case 2: v starts before u  
      cannot happen since if v finishes first before finish u, that means there would be a backward edge (they may be disconnected, but that's fine because there is not order issue)