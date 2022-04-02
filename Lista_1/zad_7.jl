#Autor: Szymon Brzeziński

"""
Funkcja example zwracająca wartość y dla danego x
x - argument funkcji
"""
function example(x)
    f = sin(x) +cos(3x)
    f    
end
"""
Funkcja example_derivative zwracająca pochodną funkcji example(x) dla danego x
x - argument funkcji
"""
function example_derivative(x)
    f = cos(x) - 3 * sin(3*x)
    f
end

"""
Funkcja derivative zwracająca pochodną funkcji example w punkcje x,
w punkcje h + 1 a także błąd |derivative(x) - example_derivative(x)|

x - argument funkcji
"""
function derivative(x, n = 0)
    if n <= 54
        n = n + 1
        
        h = 2.0^-n
        f = (example(x + h) - example(x)) / h  
        derivative(x, n)
        println("n ",n)
        println("function ", f)
        println("error ", abs(example_derivative(x) - f))
        println("h ", h)
        g = (example(h + h + Float64(1.0)) - example(h+Float64(1.0))) / h
        println("f, h+1 ", g)
        println() 
        f
    end
end





derivative(Float64(1.0))