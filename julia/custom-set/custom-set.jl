import Base: isempty, in, issubset, push!, intersect!, intersect,
             isequal, ==, union, union!, length, iterate, copy, eltype

# abstract type CustomSet <: Base.AbstractSet end

mutable struct CustomSet{T}
    elements::Set{T}
end

function CustomSet(X::Vector{T}) where T <: Real
    CustomSet(Set([X...]))
end

function CustomSet(X::Vector{Any})
    isempty(X) ? CustomSet(Set{Integer}()) : throw(error("something is wrong"))
end

issubset(c::CustomSet,s::CustomSet) = issubset(c.elements,s.elements)
isequal(c::CustomSet,s::CustomSet) = isequal(c.elements,s.elements)
==(c::CustomSet,s::CustomSet) = isequal(c,s)

function push!(c::CustomSet{T},x::V) where T <: Real where V <: Real
    push!(c.elements,convert(T,x))
end

intersect(c::CustomSet,s::CustomSet) = CustomSet(intersect(c.elements,s.elements))
function intersect!(c::CustomSet,s::CustomSet)
    intersect!(c.elements,s.elements)
end
disjoint(c::CustomSet,s::CustomSet) = isempty(intersect(c.elements,s.elements))
union(c::CustomSet,s::CustomSet) = CustomSet(union(c.elements,s.elements))
union!(c::CustomSet,s::CustomSet) = CustomSet(union!(c.elements,s.elements))
complement(a::Set,b::Set) = Set([c for c ∈ a if c ∉ b])
complement(c::CustomSet,s::CustomSet) = CustomSet(complement(c.elements,s.elements))
function complement!(c::CustomSet,s::CustomSet)
    c.elements = complement(c.elements,s.elements)
end

length(c::CustomSet) = length([s for s ∈ c.elements])

function iterate(c::CustomSet, i::Integer = 1)
    els = [ e for e ∈ c.elements ]
    return i > length(c) ? nothing : ( els[i], i + 1)
end
eltype(c::CustomSet) =  eltype(c.elements)

copy(c::CustomSet) = CustomSet(copy(c.elements))
