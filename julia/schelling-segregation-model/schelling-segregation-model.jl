using Plots, LinearAlgebra, Random

abstract type AbstractAgent end

mutable struct Agent{T<:Real} <: AbstractAgent
    posX::T
    posY::T
    color::Bool
end

get_position(a::Agent) = [a.posX, a.posY]

function move!(a::Agent)
    a.posX = rand()
    a.posY = rand()
    a
end

get_distance(a::Agent, b::Agent) = norm(get_position(b) - get_position(a))

function is_happy(agent::Agent, neighbors::Vector{<:AbstractAgent}; neighborhood::Int=10)
    neighborhood <= 1 && throw(DomainError(neighborhood, "Specify a non-trivial neighborhood."))
    neighborhood > length(neighbors) && throw(DomainError(neighborhood,"The neighborhood is too big."))

    distances = sort([ (get_distance(agent, neighbor), neighbor) for neighbor in neighbors ])
    sameNeighbors = sum([agent.color == neighbor.color for (d, neighbor) in distances[1:neighborhood]])
    sameNeighbors >= div(neighborhood,2)
end

function cycle_through!(agents; neighborhood::Int=10)
    wish_to_move, cycle = true, 0
    while wish_to_move
        # default mode --> no agents wants to move
        wish_to_move = false
        for agent in agents
            oldLocation = get_position(agent)
            while !is_happy(agent, agents; neighborhood=neighborhood)
                move!(agent)
            end
            newLocation = get_position(agent)
            # if at least one agent wants to move, then do not change wish_to_move anymore
            if !wish_to_move
                wish_to_move = !isapprox(norm(oldLocation - newLocation), 0, atol=1e-6)      
            end
        end
        @show cycle += 1
    end
    return cycle
end

function plot_agents(agents::Vector{<:AbstractAgent}; title::String="")
    x = [ agent.posX for agent in agents if !agent.color ]
    y = [ agent.posY for agent in agents if !agent.color ]
    scatter(x,y, color=:orange, markersize=3,title=title)
    x = [ agent.posX for agent in agents if agent.color ]
    y = [ agent.posY for agent in agents if agent.color ]
    scatter!(x,y, color=:green, markersize=3, title=title)
end

function run_model(n::Int=300; neighborhood::Int=10)
    n <= 1 && throw(DomainError(n, "Number of agents should be greater than one."))
    agents = [ Agent(rand(), rand(), bitrand()[1]) for i in 1:n ]
    plot_before = plot_agents(agents; title="Cycle 0")
    total_cycles = cycle_through!(agents; neighborhood=neighborhood)
    plot_after = plot_agents(agents; title="Cycle $total_cycles")
    plot(plot_before, plot_after, legend=false)
end