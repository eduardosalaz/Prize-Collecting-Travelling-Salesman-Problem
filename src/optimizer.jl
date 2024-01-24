module optimizer
using JuMP, Gurobi

function gurobi_optimizer(c, w0, prizes, total_travel_cost)
    # Calculate the total number of cities
    n = length(prizes)
    
    # Create a model
    model = Model(Gurobi.Optimizer)

    # Variables
    @variable(model, y[1:n], Bin)
    @variable(model, x[1:n, 1:n], Bin)

    # Objective
    @objective(model, Max, sum(prizes[i] * y[i] for i in 1:n) - sum(c[i, j] * x[i, j] for i in 1:n for j in 1:n))

    # Constraints
    @constraint(model, [i in 1:n], sum(x[j, i] for j in setdiff(1:n, [i])) - y[i] == 0)
    @constraint(model, [j in 1:n], sum(x[i, j] for i in setdiff(1:n, [j])) - y[j] == 0)
    @constraint(model, sum(prizes[i] * y[i] for i in 1:n) >= w0)

    # Solve the model
    optimize!(model)

    # Check the optimization status
    if termination_status(model) == MOI.INFEASIBLE
        println("The model is infeasible.")
        return NaN  # or another appropriate value to indicate infeasibility
    end

    # Get the optimal value
    optimal_value = objective_value(model)

    # Calculate the optimality gap
    optimality_gap = ((total_travel_cost - optimal_value) / total_travel_cost) * 100

    return optimal_value, optimality_gap
end

end