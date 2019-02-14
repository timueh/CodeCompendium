# core function for individual `Char`
function rotate(n::Int,letter::Char)::Char
    if lowercase(letter) in 'a':'z'
        baseLetter = isuppercase(letter) ? 'A' : 'a'
        baseLetter + (letter-baseLetter+n)%26
    else
        letter
    end
end

# function for `String`
function rotate(n::Int,input::String)::String
    # @assert 0<=n<=26 "n=$n is not valid."
    join([rotate(n,letter) for letter in input])
end

# bonus exercise
# ⟶ use metaprogramming to auto-generate code for non-standard literals
for i in 0:26
    @eval begin
            macro $(Symbol("R$i",'_',"str"))(s)
                rotate($i,s)
            end
    end
end
