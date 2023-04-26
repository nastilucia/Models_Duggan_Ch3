@variables t
D = Differential(t)

function non_renewable_stock(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters capacity = params[:capacity]
    @parameters ref_availability = params[:ref_availability]
    @parameters ref_growth_rate = params[:ref_growth_rate]

    @variables stock(t) = inits[:stock]
    @variables availability(t) 
    @variables growth_rate(t) 
    @variables net_flow(t) 
    @variables a_eff(t)
    
    eqs = [
        D(stock) ~ net_flow
        net_flow ~ stock * growth_rate
        availability ~ 1 - (stock/ capacity)
        a_eff ~ availability / ref_availability
        growth_rate ~ ref_growth_rate * a_eff
        
    ]

    ODESystem(eqs; name)
end