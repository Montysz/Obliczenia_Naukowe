#Autor: Szymon Brzeziński

using LinearAlgebra

function hilb(n::Int)
    # Function generates the Hilbert matrix  A of size n,
    #  A (i, j) = 1 / (i + j - 1)
    # Inputs:
    #	n: size of matrix A, n>=1
    #
    #
    # Usage: hilb(10)
    #
    # Pawel Zielinski
            if n < 1
             error("size n should be >= 1")
            end
            return [1 / (i + j - 1) for i in 1:n, j in 1:n]
end

function matcond(n::Int, c::Float64)
    # Function generates a random square matrix A of size n with
    # a given condition number c.
    # Inputs:
    #	n: size of matrix A, n>1
    #	c: condition of matrix A, c>= 1.0
    #
    # Usage: matcond(10, 100.0)
    #
    # Pawel Zielinski
            if n < 2
             error("size n should be > 1")
            end
            if c< 1.0
             error("condition number  c of a matrix  should be >= 1.0")
            end
            (U,S,V)=svd(rand(n,n))
            return U*diagm(0 =>[LinRange(1.0,c,n);])*V'
end

"""
Funkcja gauss rozwiązująca układ liniowy metodą Gaussa
A - macierz
x - ciąg 1 
g - wynik funkcji
g_error - błąd względny funckji
"""
function gauss(A, x, b = A * x)
    g = A \ b
    g_error = norm(g - x) / norm(x)
    #print("Gauss: ", g," error ",g_error)
    print(g_error,"&")
end

"""
Funkcja gauss rozwiązująca układ liniowy 
przy użyciu macierzy odwrotnej
A - macierz
x - ciąg 1 
i - wynik funkcji
i_error - błąd względny funckji
"""
function inversion(A, x, b = A * x)
    i = inv(A) * b
    i_error = norm(i - x) / norm(x)
    #println("Inversion: ", i," error ",i_error)
    print("$i_error")
end

"""
Funkcja test wywołująca powyższe funkcje
dla rmacierzy Hilberta oraz Losowej o rozmiarach 1-20
"""
function test()
    println("Hilbert Matrix:")
    for i in 1:20
        A = hilb(i)
        x = ones(Float64, i)
        print(i,"&")
        print(cond(A),"&")
        b = A * x
        gauss(A, x)
        inversion(A, x)
        print("\\")
        print("\\")
        print("\n")
        println("\\hline")
    end

    println("\nRandom Matrix:")
    for i in [5, 10, 20]
        for j in [1.0, 10.0, 10.0^3, 10.0^7, 10.0^12, 10.0^16]
            A = matcond(i, j)
            x = ones(Float64, i)
            print(i,"&")
            print(j,"&")

            gauss(A, x)
            inversion(A, x)
            print("\\")
            print("\\")
            print("\n")
            println("\\hline")
        end
    end
end



test()
