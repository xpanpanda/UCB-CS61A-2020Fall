LAB_SOURCE_FILE = __file__



this_file = __file__

def skip_add(n):
    """ Takes a number n and returns n + n-2 + n-4 + n-6 + ... + 0.

    >>> skip_add(5)  # 5 + 3 + 1 + 0
    9
    >>> skip_add(10) # 10 + 8 + 6 + 4 + 2 + 0
    30
    >>> # Do not use while/for loops!
    >>> from construct_check import check
    >>> # ban iteration
    >>> check(this_file, 'skip_add',
    ...       ['While', 'For'])
    True
    """
    if n==0 or n==1:
        return n
    else:
        return skip_add(n-2)+n


def summation(n, term):

    """Return the sum of the first n terms in the sequence defined by term.
    Implement using recursion!

    >>> summation(5, lambda x: x * x * x) # 1^3 + 2^3 + 3^3 + 4^3 + 5^3
    225
    >>> summation(9, lambda x: x + 1) # 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
    54
    >>> summation(5, lambda x: 2**x) # 2^1 + 2^2 + 2^3 + 2^4 + 2^5
    62
    >>> # Do not use while/for loops!
    >>> from construct_check import check
    >>> # ban iteration
    >>> check(this_file, 'summation',
    ...       ['While', 'For'])
    True
    """
    assert n >= 1
    if n==1:
        return term(n)
    else:
        return term(n)+summation(n-1,term)


def paths(m, n):
    """Return the number of paths from one corner of an
    M by N grid to the opposite corner.

    >>> paths(2, 2)
    2
    >>> paths(5, 7)
    210
    >>> paths(117, 1)
    1
    >>> paths(1, 157)
    1
    """
    if n==1 or m==1:
        return 1
    else:
        return paths(m,n-1)+paths(m-1,n)



def max_subseq(n, t):
    """
    Return the maximum subsequence of length at most t that can be found in the given number n.
    For example, for n = 20125 and t = 3, we have that the subsequences are
        2
        0
        1
        2
        5
        20
        21
        22
        25
        01
        02
        05
        12
        15
        25
        201
        202
        205
        212
        215
        225
        012
        015
        025
        125
    and of these, the maxumum number is 225, so our answer is 225.

    >>> max_subseq(20125, 3)
    225
    >>> max_subseq(20125, 5)
    20125
    >>> max_subseq(20125, 6) # note that 20125 == 020125
    20125
    >>> max_subseq(12345, 3)
    345
    >>> max_subseq(12345, 0) # 0 is of length 0
    0
    >>> max_subseq(12345, 1)
    5
    """
    # i=0
    # bit=0
    # subsequence=[]
    # while n//pow(10,i)>0:
    #     bit+=1
    #     i+=1
    # if t>=bit:
    #     return n
    # elif t==0:
    #     return 0
    # else:
    #     for i in range(1,bit+1):
    #         higher=n//pow(10,i)
    #         lower=(n%pow(10,i))%pow(10,i-1)
    #         subsequence.append(higher*pow(10,i-1)+lower)
    #     return max(max_subseq(k,t) for k in subsequence)
    if t==0:
        return 0
    last=n%10
    rest=n//10
    keep_the_last=max_subseq(rest,t-1)*10+last
    drop_the_last=max_subseq(rest,t)
    return max(keep_the_last,drop_the_last)
        
            
        

def add_chars(w1, w2):
    if len(w1)==0:
        return w2
    elif w2[0]==w1[0]:
        return add_chars(w1[1:],w2[1:])
    else:
        return w2[0]+add_chars(w1,w2[1:])

