#Autor: Szymon Brzeziński

using SymPy

using Plots
"""
Funkcja f_ opisana w treści zadania
x - parametr funkcji
"""
function f_(x)
    x = exp.(x) * log.(1.0 + exp.(-x))
end


x = symbols("x")
l = limit(f_(x), x, oo)
println(" lim x->oo f(x) = ", l)

print(abs(f_(15.1001) - f_(15.0) )/ f_(5.0000))

