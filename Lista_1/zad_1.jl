#Autor: Szymon Brzeziński

"""
Funkcja macheps znajdująca epsilon maszynowy
mode - typ arytmetki w której wykonujemy obliczenia 
"""
function macheps(mode)
    m = mode(1.0)
    while mode(1.0) + m / 2 > 1.0 && mode(1.0) + m / 2 == 1 + m / 2
        m = m / 2
    end
    m
end

"""
Funkcja eta znajdująca liczbę maszynową eta
mode - typ arytmetki w której wykonujemy obliczenia 
"""
function eta(mode)
    e = mode(1.0)
    while e / 2 != 0
        e = e / 2
    end
    e
end


"""
Funkcja max znajdująca maksymalną wartość
mode - typ arytmetki w której wykonujemy obliczenia 
"""
function max(mode)
    m = mode(1.0)
    while !(isinf(m * 2))
        m = m * 2
    end
    l = m / 2
    while !isinf(m + l) && l >= mode(1.0)
        m += l
        l /= 2
    end
    m    
end


"""
floats - Tablicza przechowująca typy arytmetki
"""
floats = [Float16, Float32, Float64]

foreach(mode -> println(macheps(mode), " eps: ", eps(mode)), floats)
println()
foreach(mode -> println(eta(mode), " nextfloat: ", nextfloat(zero(mode))), floats)
println()
foreach(mode -> println(max(mode), " floatmax: ", floatmax(mode)), floats)
println()

