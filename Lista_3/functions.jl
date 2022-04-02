#Szymon Brzeziński

module functions


"""
Funkcja mbisekcji licząca pierwiastek zadanej funkcji
metodą bisekcji
f - zadana funkcja
a - początek przedziału
b - koniec przedziału
delta, epsilon - dokładność obliczeń

Return: (r, v, it, err):
r - przybliżona wartość pierwiastka równania f(x) = 0
v - f(r)
it - illość wykonanych iteracji
err - kod błędu:
    0 - brak błędu
    1 - funkcja nie zmienia znaku w przedziale [a,b]
"""
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    u = f(a)
    v = f(b)
    e = b - a

    if sign(u) == sign(v)
        return (0, 0, 0, 1)
    end

    k = 0
    while true
        k = k + 1
        e = e / 2
        c = a + e
        w = f(c)
        if abs(e) < delta || abs(w) < epsilon
            return (c,w,k,0)
        end
        if sign(w) != sign(u)
            b = c
            v = w
        else
            a = c
            u = w
        end       
    end
end

"""
Funkcja mstycznych licząca pierwiastek zadanej funkcji
metodą Newtona
f - zadana funkcja
pf - pochodna zadanej funkcji
x0 - przybliżenie początkowe
delta, epsilon - dokładność obliczeń
maxit - maksymalna ilość iteracji

Return: (r, v, it, err):
r - przybliżona wartość pierwiastka równania f(x) = 0
v - f(r)
it - illość wykonanych iteracji
err - kod błędu:
    0 - brak błędu
    1 - nie osiągnięto wymaganej dokładności w maxit iteracji
    2 - pochodna bliska zeru
"""
function mstycznych(f,pf,x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    v = f(x0)
    if abs(v) < epsilon
        return (x0, v, 0, 0)
    end
    
    if abs(pf(x0)) < epsilon 
        return (x0, v, 0, 2)
    end

    for k in 1:maxit
        x1 = x0 - (v / pf(x0))
        v = f(x1)
    
        if abs(x1-x0) < delta || abs(v) < epsilon
          return (x1, v, k, 0)
        end
        x0 = x1
    end
    return (0, 0, 0, 1)
end

"""
Funkcja msiecznych licząca pierwiastek zadanej funkcji
metodą siecznych
f - zadana funkcja
x0, x1 - przybliżenia początkowe
delta, epsilon - dokładność obliczeń
maxit - maksymalna ilość iteracji

Return: (r, v, it, err):
r - przybliżona wartość pierwiastka równania f(x) = 0
v - f(r)
it - illość wykonanych iteracji
err - kod błędu:
    0 - metoda zbieżna
    1 - nie osiągnięto wymaganej dokładności w maxit iteracji
"""
function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    fa = f(x0)
    fb = f(x1)
    for k in 1:maxit
        if abs(fa) > abs(fb)
            t = x0
            x0 = x1
            x1 = t

            t = fa
            fa = fb
            fb = t
        end
        s = (x1 - x0) / (fb - fa)
        x1 = x0
        fb = fa
        x0 = x0 - (fa * s)
        fa = f(x0)
        if abs(x1 - x0) < delta || abs(fa) < epsilon
            return (x0, fa, k, 0)
        end
    end

    return(0,0,0,1)
end

export mbisekcji, mstycznych, msiecznych
end