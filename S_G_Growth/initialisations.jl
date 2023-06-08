#init 
_inits = Dict{Symbol,Float64}(
    :stock => 100,
)

getinitialisations() = copy(_inits)