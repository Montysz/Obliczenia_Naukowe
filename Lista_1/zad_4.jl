#Autor: Szymon Brzeziński

"""
Funkcja find znajdująca w arytmetyce Float64 najmiejszą liczbę x
wiekszą od 1, taką, że x*(1/x) != 1
"""
function find()
    x = nextfloat(Float64(1.0))
    while x < Float64(2.0)
        if Float64(x) * (Float64(1.0) / Float64(x)) != Float64(1.0)
            println("Found ",x)
            println("1 / x * x = ",(1/x)*x)
            return x
        else
             x = nextfloat(Float64(x))
        end
    end
end

find()