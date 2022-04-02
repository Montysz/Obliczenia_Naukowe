
#Autor: Szymon Brzeziński

"""
Funkcja equation opisana w treści zadania
p_n, r - parametr funkcji
mode - arytmetyka
"""
function equation(p_n, r, mode)
    y = mode(p_n) + mode(r) * mode(p_n) * mode(1 - p_n)
end

"""
Funkcja test wykonująca eskperymenty:
40 iteracji funkcji equation

p_n, r - parametr funkcji
mode - arytmetyka
cut - jeśli True w 10 iteracji zamienia p_n na 0.722
"""
function test(mode, cut)
    println("\nMode ", mode,"\n")
    p_0 = mode(0.01)
    r = mode(3)

    p_n = p_0
    for i in 1:40
        p_n = equation(p_n, r, mode)
        println(i,"  ",p_n)
    end
    
    if cut
        println("\nAfter modification: ")
        p_n = mode(0.722)
        for i in 11:40
            p_n = equation(p_n, r, mode)
            println(i,"  ",p_n)
        end 
    end 
end
"""
Funkcja test_latex tożsama do test
ale drukuję wyniki w formacie używanym 
do tworzenia tabel w Latexie
"""
function test_latex()
    r_32 = Float32(3)
    r_64 = Float64(3)
    
    p_n_1 = Float64(0.01)
    p_n_2 = Float32(0.01)

    p_n_3 = Float32(0.01)
    for i in 1:40
        p_n_1 = equation(p_n_1, r_64, Float64)
        p_n_2 = equation(p_n_2, r_32, Float32)


        if i == 11
            p_n_3 = Float32(0.722)
        end

        p_n_3 = equation(p_n_3, r_32, Float32)
    
        print(i,"&",p_n_2,"&",p_n_3,"&",p_n_1, "\\\\")
        
        print("\n\\hline\n")
    end 
end

#test(Float32, true)
#test(Float64, false)
test_latex()
