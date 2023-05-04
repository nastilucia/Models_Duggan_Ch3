module S_G_Growth

using WorldDynamics
using ModelingToolkit

include("S_G_Growth/tables.jl")
include("S_G_Growth/parameters.jl")
include("S_G_Growth/initialisations.jl")
include("S_G_Growth/subsystems.jl")
include("S_G_Growth/scenarios.jl")
include("S_G_Growth/plots.jl")

end