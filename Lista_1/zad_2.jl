function macheps_Kahan(mode)
    m = mode(3.0)*(mode(4.0)/mode(3.0)-mode(1.0))-mode(1.0)
    m 
end

floats = [Float16, Float32, Float64]
foreach(mode -> println(macheps_Kahan(mode), " eps: ", eps(mode)), floats)