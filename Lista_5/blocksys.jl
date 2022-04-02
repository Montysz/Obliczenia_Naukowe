#Szymon Brzeziński
module blocksys

include("matrix_gen.jl")

using .matrixgen
using SparseArrays

export load_matrix, load_vector, rightSide, gauss_elimination, gauss_elimination_choice

    """
    Funkcja load_matrix ładująca do macierz z pliku w postaci CSC
    file - nazwa pliku
    rows, cols, vals - tablice z parametrami do macierzyCSC
    A - zwracana macierz
    """
    function load_matrix(file) :: SparseMatrixCSC{Float64, Int}
        cols = []
        rows = []
        vals = []

        for line in Iterators.drop(eachline(file), 1)
            l = split(line)
            push!(rows, parse(Int, l[1]))
            push!(cols, parse(Int, l[2]))
            push!(vals, parse(Float64, l[3]))
        end
        A = sparse(rows, cols, vals)
        return A
    end
    
    """
    Funkcja load_vector ładująca do macierz z pliku w postaci CSC
    file - nazwa pliku
    b - zwracany wektor
    """
    function load_vector(file)
        b = []

        for line in Iterators.drop(eachline(file), 1)
            push!(b, parse(Float64, line))
        end
            
        return b
    end

    """
    Funkcja rightSide liczący wektor prawych stron dla zadanej macierzy
    A - zadana macierz
    size - rozmiar A
    blocksys - rozmiar macierzy blokowej
    rs - zwracany wektor
    """
    function rightSide(A::SparseMatrixCSC{Float64,Int}, size::Int, block_size::Int)
        rs = zeros(Float64, size)

        for i in 1:size
            for j in max(i - (2 + block_size), 1):min(i + block_size, size)
                rs[i] = rs[i] + A[i, j]
            end
        end       
        return rs
    end

    """
    Funkcja gauss_elimination rozwiązująca macierz 
        metodą Gaussa
    A - zadana macierz
    b - zadany wektor
    size - rozmiar A
    blocksys - rozmiar macierzy blokowej
    rs - zwracany wektor rozwiązań
    """
    function gauss_elimination(A, b, size, block_size)
        #print(A)

        for i in 1:size-1
            for m in i+1:min(size, i + block_size + 1)
                I = A[m, i] / A[i, i]
                A[m, i] = 0.0

                for n in i+1:min(size, i + block_size + 1)
                    A[m, n] = A[m, n]  - I * A[i, n]
                end
                b[m] = b[m] - (I * b[i])
            end
        end
        #print(A)
        rs = zeros(Float64, size)

        for i in size:-1:1
            J = 0
            for j in i+1:min(size, i + block_size + 2)
                J = J + A[i, j] * rs[j]
            end
            rs[i] = (b[i] - J) / A[i, i]
        end

        return rs
    end
    
    """
    Funkcja gauss_elimination rozwiązująca macierz
        metodą Gaussa z częściowym wyborem
    A - zadana macierz
    b - zadany wektor
    size - rozmiar A
    blocksys - rozmiar macierzy blokowej
    rs - zwracany wektor rozwiązań
    """
    function gauss_elimination_choice(A, b, size, block_size)
        curs = collect(1:size)

        for i in 1:size-1
            lastRow = 0
            lastColumn = 0

            for m in i:min(size, i + block_size + 1)
                if abs(A[curs[m], i]) > lastColumn
                    lastColumn = abs(A[curs[m], i])
                    lastRow = m
                end
            end
            curs[lastRow], curs[i] = curs[i], curs[lastRow]

            for m in i+1:min(size, i + block_size + 1)
                z = A[curs[m], i] / A[curs[i], i]
                A[curs[m], i] = 0.0

                for n in i+1:min(size, i + 2 * block_size)
                    A[curs[m], n] = A[curs[m], n] - z * A[curs[i], n]
                end
                b[curs[m]] = b[curs[m]] - z * b[curs[i]]
            end
        end


        rs = zeros(Float64, size)
        
        for i in 1:size-1
            for m in i+1:min(size, i + 2 * block_size)
                b[curs[m]] = b[curs[m]] - A[curs[m], i] * b[curs[i]]
            end
        end

        for i in size:-1:1
            currentSum = 0
            for j in i+1:min(size, i + 2 * block_size)
                currentSum += A[curs[i], j] * rs[j]
            end
            rs[i] = (b[curs[i]] - currentSum) / A[curs[i], i]
        end

        return rs
    end

end

