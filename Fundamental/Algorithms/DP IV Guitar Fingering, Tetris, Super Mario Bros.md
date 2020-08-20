### DP IV: Guitar Fingering, Tetris, Super Mario Bros.

#### 2 kinds of guessing

in step 2&3: guessing which subprob to use to solve bigger subprob

**in step 1: add more subprobs to guess(remember more features of the solution)**

#### Piano/guitar fingering

given sequence of n notes, find fingering for each note(single)

- fingers 1,..., F
- difficulty measure d(p,f,q,g) some note p on finger f, and we want to transition to note q on finger g

1. subproblem = how to play notes[i:] when use f for notes[i]

2. guess: finger g for notes[n+1]
3. recurrence:  
   DP(i,f) = min (DP(i+1,g) + d(notes[i],f,notes[i+1],g)  
   for g in 1,...,f)
4. topo order:  
   for i in reversed(range(n)):  
       for f in 1,...,f:
5. orig problem:  
   min(DP(s,f) for f in 1,..,f)  
   n•F•Θ(F) = Θ(nF<sup>2</sup>)

- if we want to make it a single-source prob just add a source node at the beginning and link it to all 5 posible starting fingers with weights of 0

##### Guitar

- generalize "finger" to finger + string  
  time->Θ(nF<sup>2</sup>S<sup>2</sup>) 

##### Multiple notes

- notes[i] = list of notes ≤ F and for guitar we still have ≤ S
- state: we need to know about "past" is assignment of fingers to notes/null  
  (F+1)<sup>F</sup>
- time -> Θ(n(F+1)<sup>2F</sup>) 

#### Tetris training

- given seq, of n pieces to fall
- must drop from top
- full rows don't clear
- can you survive?
- the width of the board is small
- board is empty

1. subproblems = how to play suffix pieces[i:]  
   given the board skyline  
   n(h+1)<sup>w</sup> subprobs
2. guess  
   how to play piece 4w where 4 for rotations and w for choices on x axis  
   running time = (n•w•(h+1)<sup>w</sup>)

#### Super Mario Bros

- given level   n
- small w•h screen
- configuration:  
  everything on screen   C<sup>wh</sup>  
  mario's velocity   C  
  score   S  
  time   T  
  screen vs level   w  
- [notes](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/MIT6_006F11_lec22.pdf)

