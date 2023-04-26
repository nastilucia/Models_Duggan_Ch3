using ModelingToolkit
using DifferentialEquations

function nrs_run_solution()
    isdefined(@__MODULE__, :_solution_nrs_run) && return _solution_nrs_run
    global _solution_nrs_run = WorldDynamics.solve(nrs_run(), (0, 100), solver=Tsit5(), dt=0.015625, dtmax=0.015625)
    return _solution_nrs_run
end

function _variables_nrs()
    @named nrs = non_renewable_stock()

    variables = [
        (nrs.stock, 0, 10000, "Stock"),
        (nrs.availability, 0, 1, "Availability"),
        (nrs.net_flow, 0, 250, "Net Flow"),
        (nrs.growth_rate, 0, 0.1, "Growth Rate"),

    ]

    return variables
end

fig_3_4(; kwargs...) = plotvariables(nrs_run_solution(), (t, 0, 100), _variables_nrs(); title="Simulation output showing of limits to growth model", showaxis=true, showlegend=true, kwargs...)

