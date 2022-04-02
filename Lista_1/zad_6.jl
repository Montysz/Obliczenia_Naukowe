#Autor: Szymon Brzeziński

"""
Funkcja f_(x) zwracająca wartość y dla danego x
x - argument funkcji
"""
function f_(x)
    a = sqrt(x^2+1) - 1
end

"""
Funkcja g_(x) zwracająca wartość y dla danego x
x - argument funkcji
"""
function g_(x)
   a = x^2 / (sqrt(x^2 + 1) + 1) 
end

"""
Funkcja test_(x) drukująca wartości funkcji
f_(x) i g_(x) dla argumentu x do potęg z przedziału [1,n]
x - argument funkcji
n - górny zakres potęg, do którego będziemy podnosić x
"""
function test(x, n)
   for i = 1:n
      f = f_(x^-i)
      g = g_(x^-i)
      println("f(",x,"^-",i,") = ",f)
      println("g(",x,"^-",i,") = ",g)
   end
end

test(8.0, 15)