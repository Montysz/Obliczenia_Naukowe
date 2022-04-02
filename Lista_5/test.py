
n = 84141
if n >= 0:
    p = n // 2
    p = 2 * p
    if n != p:
        print(1)
    else:
        print(0)
    n = n // 2
    #print("n", n)
    while n != 0:
        p = n // 2
        p = 2 * p
        if n != p:
            print(1)
        else:
            print(0)
        n = n // 2
        #print("n", n)
    