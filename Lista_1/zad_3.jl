#Autor: Szymon Brzeziński


"""
Funkcja check sprawdzająca równomierne rozmieszczenie
lizb w danym przedziale

a - początek sprawdzanego przedziału
b - koniec sprawdzanego przedziału
delta - krok sprawdzania
cup - zmienna decydująca ile pierwszych liczb sprawdzać,
domyślna wartość -1 sprawdza wszystkie liczby z przedziału
"""
function check(delta, a, b, cup = -1)    
    c = 0
    while a <= b
        println(bitstring(a))
        if nextfloat(a) != a + delta
            println("False ", a)
        end
        a = nextfloat(a)
        c = c + 1
        if c == cup
            println()
            return
        end
    end
    println("True")
    return true
end

cup = 8

delta = 2^(-52)
check(delta, 1.0, 2.0, cup)

delta = 2^(-51)
check(delta, 2.0, 4.0, cup)

delta = 2^(-53)
check(delta, 0.5, 1.0, cup)