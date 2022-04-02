#Szymon Brzeziński


include("./functions.jl")
using .functions

"""
Funckja f - zadana funkcja
"""
function f(x)
    exp(x) - 3*x
end

println(mbisekcji(f, 0.0, 1.0, 10^(-4), 10^(-4)))
println(mbisekcji(f, 1.0, 2.0, 10^(-4), 10^(-4)))