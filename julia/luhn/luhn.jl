function luhn(input::String)
    length(input) <= 1 && return false
    clean = filter(!isspace,input)
    filter(isletter,clean) |> length > 0 && return false
    nums = parse(Int,clean) |> digits |> reverse
    nums[1:2:end] = map(x->2x>9 ? 2x-9 : 2x,nums[1:2:end])
    sum(nums) % 10 == 0
end
