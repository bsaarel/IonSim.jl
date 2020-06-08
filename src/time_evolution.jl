import QuantumOptics.timeevolution
using QuantumOptics: Basis, Operator

# when solving for unitary evolution, it is convenient to switch back and forth between an 
# initial state that is pure and one that is mixed
function timeevolution.schroedinger_dynamic(tspan, rho0::T, f::Function;
            fout::Union{Function,Nothing}=nothing, kwargs...
	    ) where {B<:Basis,T<:Operator{B,B}}
    Jvec = []
    timeevolution.master_dynamic(tspan, rho0, (t,rho) -> (f(t, rho), Jvec, Jvec), 
        fout=fout, kwargs...)
end
