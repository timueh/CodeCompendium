vec2mat(v) = hcat(v...) |> transpose |> Matrix

function toggleDoors(n::Int)
	doors = -ones(Int,n)
	allDoors = [ copy(doors) ]

	for i in 1:n
		println(doors)
		doors[i:i:n] *= -1
		push!(allDoors, copy(doors))
	end

	return vec2mat(allDoors)
end

n = 15
doors = toggleDoors(n)

using Plots
heatmap(doors; legend=false)




