import Base.+, Base.*, Base.show, Base.abs

abstract type AbstractComplex end

struct MyComplex{T} <: AbstractComplex
	real_part::T
	imag_part::T
end

function +(z1::AbstractComplex, z2::AbstractComplex)
	MyComplex(real(z1)+real(z2), imag(z1) + imag(z2))
end

function *(x::AbstractComplex, y::AbstractComplex)
	r = real(x)*real(y) - imag(x)*imag(y)
	i = real(x)*imag(y) + imag(x)*real(y)
	MyComplex(r, i)
end

real(z::AbstractComplex) = z.real_part
imag(z::AbstractComplex) = z.imag_part
abs(z::AbstractComplex) = sqrt(real(z)^2 + imag(z)^2)

function show(io::IO,z::AbstractComplex)
	sign = imag(z) >= 0 ? "+" : "-"
	println("$(real(z)) $sign j $(abs(imag(z)))")
end

function findMandelbrotColor(c::AbstractComplex; N::Int=60, absmax=1e4)
	n = 0
	z = MyComplex(0., 0.)
	while abs(z) <= absmax && n < N
		z += z*z + c
		n += 1
	end
	return 1 - n / N
end


using Plots
xAxis, yAxis = -2:0.001:0.3, -1:0.005:1
z = Float64[]

for (x, y) in Iterators.product(xAxis, yAxis)
	push!(z, findMandelbrotColor(MyComplex(x, y)))
end

heatmap(xAxis, yAxis, z, legend=false, xaxis=false, yaxis=false)