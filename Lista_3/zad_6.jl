#Szymon Brzeziński

include("./functions.jl")
using .functions


"""
Funckja f1 ,f2 - zadane funkcja
Funckja fp1, fp2 - pochodne zadanych funkcji

"""

function f1(x)
    exp(1-x) - 1
end

function fp1(x)
    -exp(1-x)
end

function f2(x)
    x*exp(-x)
end

function fp2(x)
    -exp(-x)*(x-1)
end

println(mbisekcji(f1, -100.0, 100.0, 10^(-5), 10^(-5)))
println(mbisekcji(f1, -2.0, 2.0, 10^(-5), 10^(-5)))
println(mbisekcji(f1,  0.5, 2.0, 10^(-5), 10^(-5)))
println()

println(mbisekcji(f2, -20.0, 200.0, 10^(-5), 10^(-5)))
println(mbisekcji(f2, -5.0, 5.0, 10^(-5), 10^(-5)))
println(mbisekcji(f2,  -1.0, 1.0, 10^(-5), 10^(-5)))
println()



println(mstycznych(f1, fp1, -1.0, 10^(-5), 10^(-5), 100))
println(mstycznych(f1, fp1, 0.9, 10^(-5), 10^(-5), 100))
println(mstycznych(f1, fp1, 5.0, 10^(-5), 10^(-5), 100))
println()


println(mstycznych(f2, fp2, -1.0, 10^(-5), 10^(-5), 100))
println(mstycznych(f2, fp2, -0.1, 10^(-5), 10^(-5), 100))
println(mstycznych(f2, fp2, 5.0, 10^(-5), 10^(-5), 100))
println()



println(msiecznych(f1, -2.0, 2.0, 10^(-5), 10^(-5), 100))
println(msiecznych(f1, -0.5, 1.5, 10^(-5), 10^(-5), 100))
println(msiecznych(f1, -0.9, 1.1, 10^(-5), 10^(-5), 100))
println(msiecznych(f1, -5.0, 5.0, 10^(-5), 10^(-5), 100))
println()


println(msiecznych(f2, -2.0, 2.0, 10^(-5), 10^(-5), 100))
println(msiecznych(f2, -0.5, 1.5, 10^(-5), 10^(-5), 100))
println(msiecznych(f2, -0.1, 0.1, 10^(-5), 10^(-5), 100))
println(msiecznych(f2, -5.0, 5.0, 10^(-5), 10^(-5), 100))
println()


println(mstycznych(f1, fp1, 1.1, 10^(-5), 10^(-5), 100))
println(mstycznych(f1, fp1, 2.0, 10^(-5), 10^(-5), 100))
println(mstycznych(f1, fp1, 4.0, 10^(-5), 10^(-5), 100))
println(mstycznych(f1, fp1, 8.0, 10^(-5), 10^(-5), 100))
println(mstycznych(f1, fp1, 16.0, 10^(-5), 10^(-5), 100))
println()

println(mstycznych(f2, fp2, 1.001, 10^(-5), 10^(-5), 100))
println(mstycznych(f2, fp2, 1.0, 10^(-5), 10^(-5), 100))
