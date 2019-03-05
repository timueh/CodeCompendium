using Random

global archive = Set{String}()

mutable struct Robot
    name::String
    function Robot()
        new(create_name())
    end
end

function create_name()
    n = randstring('A':'Z',2)*randstring('0':'9',3)
    while n in archive
        n = randstring('A':'Z',2)*randstring('0':'9',3)
    end
    push!(archive,n)
    n
end

function reset!(instance::Robot)
    instance.name = create_name()
end
