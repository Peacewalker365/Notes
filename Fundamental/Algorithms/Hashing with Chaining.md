### Hashing with Chaining

#### ADT: Dictionary

- Python: Dict
- Motivation
  - docdist
  - database
  - login system
  - compilers & interpreters
  - network router for looking up local machines
  - server
  - virtual memory
  - substring search
  - file and directory synchronization
  - cryptography

Simple approach

- Direct-access table
  - store items in array indexed by key
    - it may end up wasting spaces since many indices of array are unused
    - keys may not be integers
    - gigantic memory hog

Solutions

1. prehash

   - map keys to nonneg. integers
   - in theory: keys are finite and discrete (string of bits)
     - in python `hash(x)` is the prehash of x
       - ideally: hash(x) == hash(y) <=> x == y
       - but `hash(\0B)` == `hash(\0\0C)`== 64
   - Notice that the prehash function should not be mutable since you may not find the thing afterwards

2. hashing

   - reduce universe 𝜇 of all keys (integers) down to reasonable size m for table

   - idea: m = Θ(n) where n is the # of keys

   - collision: h(ki) == h(kj) but i ≠ j

   -   the solution is hashing with chaining, which means the linked list

   - so we can search anything in Θ(1), but what if a linked list is too long so  that the search time increses to Θ(n)

   - so we have to ensure our hash function can well distributing all the keys randomly

   - for the convenience, we'll apply a false assumption called Simple Uniform Hashing, which assumes each key is equally likely to be hashed to any slot of the table, indepentent of where other keys hashing

     - uniformity
     - independence

   - Analysis of Hashing with Chaining: 

     - expected length of chain for n keys, m slots is n/m, which is the load factor of the table 𝛼 
     - for instance, it will be Θ(1) if m == Θ(n)
     - running time == O(1 + the length of 1 chain) == O(1 + 𝛼)

   - Hash functions

     1. division method (not good)
        - h(k) = k mod m
        - if m is a prime, it's gonna be better since you do not have those common factors between k and m and it's not very close to power of 2 and 10
     2. multiplication method (not good but better)
        - h(k) = [(a•k) mod 2<sup>w</sup>)] >> (w-r) where k has w bits
        - [explanation](https://www.youtube.com/watch?v=0M_kIqhwbFo&list=PLUl4u3cNGP61Oq3tWYp6V_F-5jb5L2iHb&index=8)
        - m = 2<sup>r</sup>
     3. Universal hashing (GOOD!)
        - h(k) = [(ak + b) mod p] mod m
        - a,b,k is a random num in [0 - (p-1)]  
          p is a prime > |µ|
        - for worst case, keys k<sub>1</sub> ≠ k<sub>2</sub>, P(h(k<sub>1</sub>) == h(k<sub>2</sub>)) == 1/m
        - for the reason

     