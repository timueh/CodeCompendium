function raindrops(number::Int)
    t = [(3=>"Pling"),(5=>"Plang"),(7=>"Plong")]
    # just in case:
    # t = sort([(3=>"Pling"),(5=>"Plang"),(7=>"Plong")])
    s::String = ""
    for (digit,str) in t
        if number % digit == 0
            s *= str
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
