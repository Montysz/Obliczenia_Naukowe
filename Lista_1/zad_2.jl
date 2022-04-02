#Autor: Szymon Brzeziński

"""
Funkcja macheps_kanah znajdująca epsilon maszynowy metodą Kanaha
mode - typ arytmetki w której wykonujemy obliczenia 
"""
function macheps_kahan(mode)
    m = mode(3.0)*(mode(4.0)/mode(3.0)-mode(1.0))-mode(1.0)
    m 
end

"""
floats - Tablicza przechowująca typy arytmetki
"""
floats = [Float16, Float32, Float64]

foreach(mode -> println(mode, ": Kahan ",macheps_kahan(mode), " eps: ", eps(mode)), floats)