#Szymon Brzeziński

include("./functions.jl")
using .functions

x2sinx(x) = x^2 * sin(x)
ex(x) = exp(x)

arr = [5, 10, 15]
for i in arr
    rysujNnfx(ex, 0.0, 1.0, i)
    rysujNnfx(x2sinx, -1.0, 1.0, i)
end