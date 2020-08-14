### Table Doubling, Karp-Rabin

how to choose m?

- want m = Θ(n) => 𝛼 = Θ(1)

- Idea: start small: m = 8
  - grow/shrink as necessary
  - **If m > n, grow a table**
    - make table of size m'
    - build new hash f'
    - rehash
    - insert them in new table T'
    - Θ(n+m+m')
- in the case above
  - if m' = m + 1
    - the cost of n insert is Θ(1+2+3+...+n) = Θ(n<sup>2</sup>)
  - if m' = 2m Oh, Golden
    - cost of n insert is Θ(1+2+4+8+...+n) = Θ(n)
- Table Doubling => **Amortization**
  - operation take "T(n) amortized"  
    if k operations  
    take ≤ k•T(n) time
  - think of meaning  
    "T(n) on average", where average over all operations
  - SO! table doubling:  
    k insertions  
    take Θ(k) time  
    => Θ(1) amortized per insertion
  - also: k insertions & deletions  
    take O(k)
- Deletion
  - if m = n/2 then shrink to m/2  
    slow: from 2<sup>k</sup> <--> 2<sup>k</sup>+1  
    =>Θ(n) per operaiton (BAD!)
  - if m = n/4 then shrink to m/2  
    amortized time to Θ(1)

#### String Matching

- given two strings s & t:  
  does s occur as a substring of t?

- Simple algo:

  - ```python
    any(s==t)[i:i+len(s)]
    	for i in range(len(t)-len(s))
    ```

  - running time: Θ(|s|•(|t|-|s|)) ≈ Θ(|s|•|t|)

##### Rolling hash ADT

- r.append(c):  
  add the char to end of x
- r.skip(c):  
  delete the first char of x
- r maintains a string x
- r():  
  hash value of x is r(x)

##### Karp-Rabin algorithm

- for c in s:  
  rs.append(c)   here it means to append all chars in s
- for c in t[:len(s)]:  
  rt.append(c)   here it means to apend first chars of len(s) in t
- if rs() == rt()   see if two hash values are equivalent
- for i in range(len(s), len(t)):  
  **{**rt.skip(t[i - len(s)])  
  rt.append(t[i])  
  if rs() == rt()  
  if true  
  check whether s == t[i-len(s)+1 : i+1]  
  if equal:  
  found match  
  else:  
  continue the algo   this happens with probability ≤ 1/|s|**}** **=> O(1) expected time**
- **O(|s|+|t|+ #match•|s|)**

For example  
we use division method: h(k) = k mod m where m is a random prime ≥ |s|



##### Notice

1. We treat **x** as multi-digit number **u** in base **a** where a is the alphabet size  
   if it's ASCII, a = 256  
   if it's UTF 8 or 16 a will be larger
2. r.append(c):  
   u -> u•a + ord(c)
3. r.skip(c):  
   u -> u - ord(c)•a<sup>|u|-1</sup>
4. say if we use division method:  
   r -> (r•a +ord(c) - ord(c)•a<sup>|x|-1</sup>) mod m   here it's order of |x|-1 because r multiplied a at first

