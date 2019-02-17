function raindrops(number::Int)
    d = Dict(3=>"Pling",5=>"Plang",7=>"Plong")
    s::String = ""
    for digit in sort(collect(keys(d)))
        if number % digit == 0
            s *= d[digit]
        end
    end
    isempty(s) ? string(number) : s
end

# --------------------------------------------- #
# # more concise yet slower
# function raindrops(number::Int)
#     d = Dict(3=>"Pling",5=>"Plang",7=>"Plong")
#     s = join( map(x->number % x == 0 ? d[x] : "", sort(collect(keys(d)))))
#     isempty(s) ? string(number) : s
# end
