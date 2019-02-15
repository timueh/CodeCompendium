"Sum the squares of the numbers up to the given number"
function square_of_sum(n::Int)::Int
    Int(0.25 * n^2 * (n + 1)^2)
end

"Square the sum of the numbers up to the given number"
function sum_of_squares(n::Int)::Int
    Int((n * (n + 1) * (2 * n + 1)) / 6);
end

"Subtract sum of squares from square of sums"
function difference(n::Int)::Int
    n < 0 ? throw(DomainError("`n has to be non-negative`")) : nothing
    square_of_sum(n) - sum_of_squares(n)
end

# just for fun
macro differ(n::Int)
    difference(n)
end
