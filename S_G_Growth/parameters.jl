#parameters
_params = Dict{Symbol,Float64}(
    :capacity => 10000,
    :ref_availability => 1,
    :ref_growth_rate =>0.10,
)

getparameters() = copy(_params)

