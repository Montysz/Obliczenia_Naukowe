#Szymon Brzeziński

include("./functions.jl")
using .functions

f(x) = abs(x)
g(x) = 1.0 / (1.0 + x^2)

arr = [5, 10, 15]

for i in arr
    rysujNnfx(f, -1.0, 1.0, i)
    rysujNnfx(g, -5.0, 5.0, i)
end