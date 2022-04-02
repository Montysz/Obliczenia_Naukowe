#Szymon Brzeziński

include("matrix_gen.jl")
include("blocksys.jl")

using .matrixgen
using .blocksys
using SparseArrays
using LinearAlgebra

function challenge_gauss(x)
    print("gauss ",x,": \n")
    block_size = 4
    matrixFile = open(string("data/",x,"_1_1/A.txt"))
    vectorFile = open(string("data/",x,"_1_1/b.txt"))
    A = load_matrix(matrixFile)
    b = load_vector(vectorFile)
    
    (r, t, m) =  @timed gauss_elimination(A, b, x, block_size)
    er = norm(ones(x)- r) / norm(r)

    open(string("results/challenge_gauss",x), "w") do f
        println(f, er)
        for i in 1:length(r)
            println(f,r[i])
        end
    end
    println(string("time ",t),"    ", string("memory ",m ),"\n")

end

function challenge_gauss_choise(x)
    print("gauss z wyborem ",x,": \n")
    block_size = 4
    matrixFile = open(string("data/",x,"_1_1/A.txt"))
    vectorFile = open(string("data/",x,"_1_1/b.txt"))
    A = load_matrix(matrixFile)
    b = load_vector(vectorFile)
    
    (r, t, m) = @timed gauss_elimination_choice(A, b, x, block_size)
    er = norm(ones(x)- r) / norm(r)

    open(string("results/challenge_gauss_choise-",x), "w") do f
        println(f, er)
        for i in 1:length(r)
            println(f,r[i])
        end
    end
    println(string("time ",t),"    ", string("memory ",m ),"\n")

end

function simulation(a,b,step,repeats,block_size, mode)
    as = string(a)
    bs = string(b)
    steps = string(step)
    name = string("results/",as,"-",bs,"-",steps,"--",mode)
    open("result", "w") do f
    end
    for i in a:step:b
        time = 0
        memory = 0
        for r in 1:repeats
            blockmat(i, block_size, 1.0, "data/created/res")
            m = open("data/created/res")
            
            A = load_matrix(m)
            b = rightSide(A,i,block_size)
            
            if mode == 1
                (_, t, m) = @timed gauss_elimination(A, b, i, block_size)
            else
                (_, t, m) = @timed gauss_elimination_choice(A, b, i, block_size)
            end
            time = time + t
            memory = memory + m

        end
        println(i, "; ", string(time / repeats),"    ", string(memory / repeats))

        open(name, "a") do f
            println(f, i, " ", string(time / repeats),"    ", string(memory / repeats))
        end
    end
end




block_size = 4
(challenge_gauss(16))
(challenge_gauss_choise(16))

(challenge_gauss(10000))
(challenge_gauss_choise(10000))

(challenge_gauss(50000))
(challenge_gauss_choise(50000))

(challenge_gauss(100000))
(challenge_gauss_choise(100000))


#simulation(100,1000,200,100,block_size,0)
#simulation(100,10000,200,100,block_size,1)
