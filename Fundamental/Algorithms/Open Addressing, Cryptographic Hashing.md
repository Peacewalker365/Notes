### Open Addressing, Cryptographic Hashing

#### Open Addressing

- no chaining
- one item per slot => m ≥ n where m is the # of slot and n is the # of keys

##### Probing

- Hash function specifies order of slots to probe for a key (for insert/search/delete)

- h: U x {0,1,...,m-1} -> {0,1,...,m-1}

  - U is universe of keys
  - first {} is the trial count
  - the latter {} is the slot in table
  - we want to design a function h, with the property that for all k in U:
    - h(k,1), h(k,2),...,h(k,m-1)
      - k is an arbitrary key
      - to be permutation of 0,1,...,m-1
      - i.e. if we keep trying h(k,i) for increasing i, I will eventually hit all slots of the table

- ```c
  /*
  Insert(k,v)
    keep probing until an empty slot is found, treating DeleteMe as None
    
  Search(k)
    as long as the slots encountered are occupied by keys ≠ k, keep probing until you either encounter k or find an empty slot(which mean fail to find the key), and if we encounter DeleteMe, ignore it and continue
    //notice we search it using the same sequence of inserting the key, so if the key is in the table, we'll never encounter an empty slot
   
  Delete(k)
  	//the issue is that if we want to delete a key k, and replace it with None. 
  	//When I search another key k', I may find this empty slot since there was a collision in this slot while inserting k'
  	//We fail incorrectly!
  	//we need to replace deleted item with DeleteMe flag (diff from None)
  	keep probing until we find the key. While finding the key, ignore DeleteMe. If found the key, replace it with DeleteMe flag.
  */
  ```

- Probing Strategies

  1. Linear probing (not good)
     - h(k,i) = (h'(k) + i) mod m
     - why it's bad :
       - clustering: you end up getting conecutive groups of occupied slots
       - assuming 0-99 have been occupied, and the hashing function maps the key to 2 where a collision happens. Then it will try one by one until reaching 100. Then the load factor will not be attractive.
       - 0.01  < 𝛼 = n/m < 0.99  
         we see cluster of size Θ(logn) even the k in h'(k) is a prime
  2. Double  hashing (solved the pain above)
     - h(k,i) = (h<sub>1</sub>(k) + i•h<sub>2</sub>(k)) mod m
       - where **h<sub>2</sub>(k) and m are relatively prime** => permutation  
         so you will roll around in the indices
       - **we can simply set m = 2<sup>r</sup>, h<sub>2</sub>(k) for all k is odd.**
  3. Uniform Hashing Assumption
     - Each key is equally likely to have any one of the m! permutations as its probe sequence (double hashing almost did this)
     - 𝛼 = n/m  
       cost of operations  
       insert ≤ 1/(1-𝛼) where we want to keep 𝛼 small (proof in notes: p = (m-n)/n = 1 - 𝛼)
     - keep 𝛼 around 0.5



#### Cryptographic Hashing

##### Password Storage

- hashed psw stored in a file like /etc/password
- h(input) == h(psw)
- how do we deal with collisions, what properties should the hash function has?  
  read notes and wikipedia