#Autor: Szymon Brzeziński

"""
x, y - tablice przechowujące współrzedne wektorów
"""
x = [(2.718281828), (-3.141592654), (1.414213562), (0.5772156649), (0.3010299957)]
y = [(1486.2497), (878366.9879), (-22.37492), (4773714.647), (0.000185049)]


"""
Funkcja front licząca iloczyn skalarny dwóch wektórów,
metodą "w przód"
x, y - tablice przechowujące współrzedne wektorów
n - ilość współrzednych jedno wektóru
mode - typ arytmetki w której wykonujemy obliczenia 
"""
function front(n, x, y, mode)
    S = zero(mode)
    for i = 1:n
        S = mode(S) + (mode(x[i]) * mode(y[i]))
    end
    S
end

"""
Funkcja back licząca iloczyn skalarny dwóch wektórów,
metodą "w tył"
x, y - tablice przechowujące współrzedne wektorów
n - ilość współrzednych jedno wektóru
mode - typ arytmetki w której wykonujemy obliczenia 
"""
function back(n, x, y, mode)
    S = zero(mode)
    for i = 1:n
        S = mode(S) + mode(x[n-i+1]) * mode(y[n-i+1])
    end
    S
end

"""
Funkcja down licząca iloczyn skalarny dwóch wektórów,
metodą od największego do najmniejszego
x, y - tablice przechowujące współrzedne wektorów
n - ilość współrzednych jedno wektóru
mode - typ arytmetki w której wykonujemy obliczenia 
"""
function down(n, x, y, mode)
    for i = 1:n
         x[i] = mode(x[i]) * mode(y[i])
    end
    x = sort!(x)

    a = zero(mode)
    b = zero(mode)
    for i in 1:n
        if x[i] > zero(mode)
            a = mode(a) + mode(x[i])
        end
        if x[i] < zero(mode)
            b = mode(b) + mode(x[i])
        end
    end
    mode(a) + mode(b)
end

"""
Funkcja down licząca iloczyn skalarny dwóch wektórów,
metodą od najmniejszego do największego
x, y - tablice przechowujące współrzedne wektorów
n - ilość współrzednych jedno wektóru
mode - typ arytmetki w której wykonujemy obliczenia 
"""
function up(n, x, y, mode)
    for i = 1:n
        x[i] = mode(x[i]) * mode(y[i])
    end
    x = sort(x)
    a = zero(mode)
    b = zero(mode)
    for i in 1:n
        if x[i] > zero(mode)
            a = mode(a) + mode(x[i])
        end
        if x[i] < zero(mode)
            b = mode(b) + mode(x[i])
        end
    end
    mode(a) + mode(b)
end  


println("a)")
println("Float32 Front ",front(5, x, y, Float32))
println("Float64 Front ",front(5, x, y, Float64))

println("b)")
println("Float32 back ",back(5, x, y, Float32))
println("Float64 back ",back(5, x, y, Float64))

println("c)")
println("Float32 down ",down(5, x,y, Float32))
x = [(2.718281828), (-3.141592654), (1.414213562), (0.5772156649), (0.3010299957)]
y = [(1486.2497), (878366.9879), (-22.37492), (4773714.647), (0.000185049)]

println("Float64 down ",down(5, x,y, Float64))
x = [(2.718281828), (-3.141592654), (1.414213562), (0.5772156649), (0.3010299957)]
y = [(1486.2497), (878366.9879), (-22.37492), (4773714.647), (0.000185049)]

println("d)")
println("Float32 up ",up(5, x,y, Float32))
x = [(2.718281828), (-3.141592654), (1.414213562), (0.5772156649), (0.3010299957)]
y = [(1486.2497), (878366.9879), (-22.37492), (4773714.647), (0.000185049)]
println("Float64 up ",up(5, x,y, Float64))



