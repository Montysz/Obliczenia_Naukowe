#Autor: Szymon Brzeziński
using Polynomials
"""
w - współczyniki badanego wielomianu
w_2 współczyniki zaburzonego badanegow wielomianu
p_roots - pierwiastki badanego wielomianu
P - badany wielomian(postać naturalna)
p - badany wielomian
P_roots - obliczone zera, wielomianu P)
"""
w =  reverse(Float64[1, -210.0, 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,          
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0])

w_2 =  reverse(Float64[1, -210.0-2^-23, 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,          
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0])

p_roots = [x for x in 1.0:20.0]
P = Polynomials.Polynomial(w)
p = Polynomials.Polynomial(p_roots)
P_roots = Polynomials.roots(P)


for i in 1:20
    println(i,"&",P_roots[i],"&", abs(P(P_roots[i])),"&",abs(p(P_roots[i])),"&",abs(i - P_roots[i]),"\\\\")
    print("\\hline\n")
end