#Szymon Brzeziński

include("./functions.jl")
using .functions
using Test


xs1 = [3.0, 1.0, 5.0, 6.0]
fxs1 = [1.0, -3.0, 2.0, 4.0]
expected1 = [1.0, 2.0, -3.0/8.0, 7.0/40.0]

qs1 = ilorazyRoznicowe(xs1, fxs1)

@testset "ilorazyRoznicowe" begin
    @test isapprox(qs1, expected1)
end


@testset "warNewton" begin
    @test isapprox(warNewton(xs1, qs1, 2.0), -0.1)
    @test isapprox(warNewton(xs1, qs1, 10.0), 46.5)
end

@testset "naturalna" begin
    @test isapprox(naturalna(xs1, fxs1), [-44.0, 81.0, -34.0, 4.0])
end
