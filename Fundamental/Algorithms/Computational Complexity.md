### Computational Complexity

P = {problems solvable in polynomial}

NP = {decision problems solvable in poly time via a "lucky" algorithm, which a Nondeterministic model, algorithm makes guesses and output yes or no, guesses are guaranteed to lead to a yes if possible} or {decision problem with "solution" that can be "checked" in polynomial time, whenever the answer is yes, you can prove it and check it in poly time}

EXP = {problems solvable in exponential time 2<sup>n<sup>C</sup></sup>}

R = {problems solvable in finite time}

NP-hard: to the right of NP

NP-complete at the excatly point of the right border of NP

EXP-hard

EXP-complete

Examples:

- negative-weights cycle
  - detect ∈ P
- n x n Chess (who's gonna win from this position)
  - EXP but not P
- Tetris (realistic)
  - EXP
  - don't know whether P
- halting problem: given program, does it even halt/stop?
  - not in R
- Most decision problems are uncomputable( not in R )
  - program ≈ binary string ≈ natural number ∈ N(natural num)
  - decision prob: input{yes, no} ≈ {0,1} where from string to binary string
  - decision prob ∈ R(rational num)
  - |R| >> |N| => almost every prob unsolvable by any program

Tetris ∈ NP if there is a yes, the luck will lead us to the yes

Reductions: A -> B

- convert prob A that you don't know how to solve into problem B that you know how to solve

  - unweighted shortest paths -> adding weights to 1 and use Dijstra
  - min-product path ->(take logs to convert products to sums) shortest path
  - longest path -> shortest path
  - 3-Partition -> Tetris
  - traveling salesman problem
  - ...[notes](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/MIT6_006F11_lec23.pdf)

  