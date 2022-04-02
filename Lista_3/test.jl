#Szymon Brzeziński

include("./functions.jl")
using .functions
using Test

delta = 10^(-5)

@testset "Metoda bisekcji" begin
    @test abs(mbisekcji((x -> x), -1.0, 1.0, delta, delta)[1]) <=delta
    @test abs(mbisekcji((x -> 3x^2 - 26x + 35), 3.0, 12.0, delta, delta)[1] - 7) <= delta
    @test abs(mbisekcji((x ->11882916x^5 - 547201053x^4 + 8782602672x^3 - 58506378094x^2 + 148485762124x -121549335765 ), 11.0, 19.0, delta, delta)[1] - 13) <= delta
end

@testset "Metoda Newtona" begin
    @test abs(mstycznych((x -> x), (x -> 1), -1.0, delta, delta, 50)[1]) <= delta
    @test abs(mstycznych((x -> 3x^2 - 26x + 35), (x -> 6x - 26), 12.0, delta, delta,50)[1] - 7) <= delta
    @test abs(mstycznych(
                        (x ->11882916x^5 - 547201053x^4 + 8782602672x^3 - 58506378094x^2 + 148485762124x -121549335765 ), 
                        (x ->59414580x^4 - 2188804212x^3 + 26347808016x^2 - 117012756188x +148485762124), 
                        15.0, delta, delta, 50)[1] - 13) <= delta
end

@testset "Metoda siecznych" begin
    @test abs(msiecznych((x -> x), -1.0, 1.0, delta, delta, 50)[1]) <= delta
    @test abs(msiecznych((x -> 3x^2 - 26x + 35), 4.0, 12.0, delta, delta, 50)[1]- 7) <=delta
    @test abs(msiecznych((x ->11882916x^5 - 547201053x^4 + 8782602672x^3 - 58506378094x^2 + 148485762124x -121549335765 ),11.0, 19.0, delta, delta,50)[1] - 13) <= delta
end