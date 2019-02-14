function isarmstrong(x::Int)
    @assert x>0 "number has to be positive"
    dgts = digits(x)
    sum(d^length(dgts) for d in dgts)==x
end
