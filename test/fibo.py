
def fibo (n):
    a = 1
    b = 1
    i = 0
    z = 0
    while (z < 1000):
	while (i < n - 2):
	    c = a + b
	    b = a
	    a = c
	    i = i + 1	
	z += 1


    
fibo (49)
