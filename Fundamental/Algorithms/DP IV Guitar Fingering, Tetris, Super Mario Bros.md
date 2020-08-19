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
   