using Statistics, PyPlot

function system_dynamics(x, d)
	x*d
end

function data_to_plot(data, t)
	[ sample[t + 1] for sample in data ]
end

function create_paths(x0, T, D)
	x_samples = Vector{Float64}[]
	for d in D
		x_path = [x0]
		for t in 1:T
			push!(x_path, system_dynamics(x_path[t], d))
		end
		push!(x_samples, x_path)
	end
	x_samples
end

function ev_uncertain_parameter(t::Int, x0)
	t < 0 && throw(DomainError(t, "only non-negative times allowed"))
	iseven(t) ? x0 / (t+1) : 0.
end

function ev_uncertain_parameter(t, x0)
	[ev_uncertain_parameter(τ, x0) for τ in t]
end

N = 10000
d_samples = -1 .+ 2*rand(N)

x0, T = 1., 15

x_samples = create_paths(x0, T, d_samples)

ev_numeric, ev_analytic = mean(x_samples), ev_uncertain_parameter(0:T, x0)

figure(100)
plot(0:T, ev_numeric, color="green")
plot(0:T, ev_analytic, "-rx")
grid()

histogram_data = [ data_to_plot(x_samples, t) for t in 0:T ]


for t in 0:3
	figure(t+1)
	hist(histogram_data[t+1], density=true, bins=75)
	title("Probability density at time t = $t")
end




