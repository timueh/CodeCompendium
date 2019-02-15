# core function for individual `Char`
function rotate(n::Int,letter::Char)::Char
    if lowercase(letter) in 'a':'z'
        baseLetter = isuppercase(letter) ? 'A' : 'a'
        return baseLetter + ((letter - baseLetter + n) % 26)
    else
        return letter
    end
end

# function for `String`
function rotate(n::Int,input::String)::String
    # @assert 0<=n<=26 "n=$n is not valid."
    String(map(letter->rotate(n,letter),input))
    # join([rotate(n,letter) for letter in input]) # slightly less efficient
end

# bonus exercise
# ⟶ use metaprogramming to auto-generate code for non-standard literals
# for i in 0:26
#     name = Symbol("R$(i)_str")
#     @eval begin
#             macro $name(s)
#                 rotate($i,s)
#             end
#     end
# end

# more verbose version
# for i in 0:26
#     name = Symbol("R$(i)_str")
#     m = quote
#             begin
#                 macro $name(s)
#                     rotate($i,s)
#                 end
#             end
#         end
#     eval(m)
# end

# concise version
for n in 1:26
    eval(Meta.parse("macro R$(n)_str(s) rotate($n, s) end"))
end
