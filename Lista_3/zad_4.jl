#Szymon Brzeziński

include("./functions.jl")
using .functions


"""
Funckja f - zadana funkcja
Funckja fp - pochodna zadanej funkcji
"""
function f(x)
    sin(x) - (1/4)x^2
end

function fp(x)
    cos(x) - (1/2)x
end

println(mbisekcji(f, 1.5, 2.0, 10^(-5)/2, 10^(-5)/2))
println(mstycznych(f, fp,  1.5, 10^(-5)/2, 10^(-5)/2, 50))
println(msiecznych(f, 1.0, 2.0, 10^(-5)/2, 10^(-5)/2, 50))