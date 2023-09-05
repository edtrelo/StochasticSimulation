using Distributions
using Random

Random.seed!(1234)
# valor inicial
x0 = Random.rand()
# mapeo logístico
f(x) = 4x*(1-x)
"""Composición de f consigo misma `n` veces.
"""
function fcomp(n=1::Integer)
    @assert n>=1
    y = x0
    for i in 1:n
        y = f(y)
    end
    return y
end

"""Cálculo del promedio del Teorema Ergódico.
"""
function promedioergodico(n::Integer, h::Function)
    @assert n>=1
    suma = 0
    for k in 1:n
        suma += h(fcomp(k))
    end
    return suma/n
end

e1 = promedioergodico(10000, x -> x)
print("La aproximación de E[X] es ", e1)
e2 = promedioergodico(10000, x -> x^2)
print("La aproximación de E[X^2] es ", e2)




