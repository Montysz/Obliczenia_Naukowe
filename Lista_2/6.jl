#Autor: Szymon Brzeziński
using Plots

"""
Funkcja equation opisana w treści zadania
x_n, c - parametr funkcji
mode - arytmetyka
"""
function equation(x_n, c, mode)
    y = mode(x_n) * mode(x_n) + c
end

"""
Funkcja test wykonująca eskperymenty:
40 iteracji funkcji equation

x_n,c - parametr funkcji
mode - arytmetyka
"""
function test(x_n, c, mode)
    T = []
    for i in 1:40
        x_n = equation(x_n, c, mode)
        push!(T, x_n)
        #println(i,"  ",x_n)
    end
    T
end

"""
Funkcja test_latex tożsama do test
ale drukuję wyniki w formacie używanym 
do tworzenia tabel w Latexie
"""
function test_latex()
    C = [-2, -2, -2, -1, -1, -1, -1]
    X = [1, 2, 1.99999999999999, 1, - 1, 0.75, 0.25]
    for j in 1:40
        print(j)
        for i in 1:length(C)
            X[i] = equation(X[i], C[i], Float64)
            print("&",X[i])
        end
        print("\\\\\n")
        print("\\hline\n")
    end

end


"""
C,X - tablica z danymi
T - tablica z wynikami
t - tytuł wykresu
p - wykres
"""
C = [-2, -2, -2, -1, -1, -1, -1]
X = [1, 2, 1.99999999999999, 1, - 1, 0.75, 0.25]

x = []
for i in 1:40
    push!(x,i)
end

for i in 1:length(C)
    T = test(X[i], C[i], Float64)
    
    t = "x = " * string(X[i]) * " c = " * string(C[i])
    p = Plots.plot(x, T, title = t)
    q =  string(i)
    #print(q)
    Plots.savefig(p, q)
end

#test_latex()


