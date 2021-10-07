
m16 = Float16(1.0)
while m16 != m16 / 2
    if !(Float16(1.0 + m16 / 2) > 1.0 && Float16(1.0 + m16 / 2) == 1+ m16 / 2)
        break
    else
        global m16 = m16 / 2
    end
end

m32 = Float32(1.0)
while m32 != m32 / 2
    if !(Float32(1.0 + m32 / 2) > 1.0 && Float32(1.0 + m32 / 2) == 1 + m32 / 2)
        break
    else
        global m32 = m32 / 2
    end
end

m64 = Float64(1.0)
while m64 != m64 / 2
    if !(Float64(1.0 + m64 / 2) > 1.0 && Float64(1.0 + m64 / 2) == 1 + m64 / 2)
        break
    else
        global m64 = m64 / 2
    end
end



eta16 = Float16(1.0)
while eta16 != eta16 / 2
    if eta16 / 2 == 0
        break
    else
        global eta16 = eta16 / 2
    end
end

eta32 = Float32(1.0)
while eta32 != eta32 / 2
    if eta32 / 2 == 0
        break
    else
        global eta32 = eta32 / 2
    end
end

eta64 = Float64(1.0)
while eta64 != eta64 / 2
    if eta64 / 2 == 0
        break
    else
        global eta64 = eta64 / 2
    end
end

max16 = Float16(1.0)
while max16 != max16 * 2
    if isinf(max16 * 2)
        break
    else
        global max16 = max16 * 2
    end
end


println(m16," ",eps(Float16))
println(m32," ", eps(Float32))
println(m64," ", eps(Float64))
println()
println(eta16," ", nextfloat(Float16(0.0)))
println(eta32," ", nextfloat(Float32(0.0)))
println(eta64," ", nextfloat(Float64(0.0)))
println()
println(max16," ", floatmax(Float16))

