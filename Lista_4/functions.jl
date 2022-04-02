#Szymon Brzeziński

module functions
using Plots

    export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx

    """
    Funkcja ilorazyRoznicowe licząca ilorazy różnicowe
    x - zadany wektor, zawierający węzły
    f - zadany wektor, zawierający wartości interpolowanej funkcji
    fxs - zwrócony wektor z ilorazami różnicowymi
    """
    function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
        len = length(f)
        fxs = copy(f)

        for i in 1:len
            for j in len:-1:i+1
                fxs[j] = (fxs[j] - fxs[j-1]) / (x[j] - x[j - i])
            end
        end

        return fxs
    end

    """
    Funkcja warNewton licząca wartości wielomianu 
    interpolacyjnego w jego postaci Newtona
    x - zadany wektor, zawierający węzły
    fx - zadany wektor, zawierający ilorazy róźnicowe
    t - punkt w którym liczona jest wartość wielomianu
    nt - zwrócona wartośc wielomianu w t 
    """
    function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
        len = length(x)
        nt = fx[len]

        for i in len - 1:-1:1
            nt = fx[i] + (t - x[i]) * nt
        end

        return nt
    end

    """
    Funkcja naturalna licząca wartości wielomianu 
    interpolacyjnego w jego postaci Newtona
    x - zadany wektor, zawierający węzły
    fx - zadany wektor, zawierający ilorazy róźnicowe
    f - zwrócony wektor z współczynikami postaci naturalnej
    """
    function naturalna(x::Vector{Float64}, fx::Vector{Float64})
        len = length(x)
        f = zeros(len)
        f[len] = fx[len]
        
        for i in len - 1:-1:1
            f[i] = fx[i] - f[i + 1] * x[i]
            for j in i+1:len - 1
                f[j] = f[j] - f[j+1]* x[i]           
            end
        end
        
        return f
    end


    """
    Funkcja rysujNnfx interpolującej zadaną funkcję
    oraz rysująca nią 
    f - zadana funkcja
    a,b - przedział interpolacji
    n - stopnień wielomianu interpolacyjnego
    p - gęstość
    """
    function rysujNnfx(f, a::Float64, b::Float64, n::Int)
        s = n + 1
        x = zeros(s)
        y = zeros(s)
        f_x = zeros(s)
        
        p = 20
        s = s * p
        plot_f = zeros(s)
        plot_w = zeros(s)
        
        h = (b - a) / n
        delta = a
        for i in 1:n + 1
            x[i] = delta
            y[i] = f(delta)
            delta = delta + h
        end

        f_x = ilorazyRoznicowe(x, y)

        delta = a
        h = (b - a) / (s - 1)
        for i in 1:s
            plot_w[i] = warNewton(x, f_x, delta)
            plot_f[i] = f(delta)
            delta = delta + h
        end

        gr()
        Plots.plot(range(a, stop=b, length=(s)), plot_f, color = "red", label = "f(x)")
        Plots.plot!(range(a, stop=b, length=(s)),title = string("n = ",n), plot_w, color = "blue", label = "w(x)")
        Plots.savefig(string("plot-", f, "-", n,"[",a,"-",b,"].png"))
    end
end

