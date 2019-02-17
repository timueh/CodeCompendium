"Sum the squares of the numbers up to the given number"
square_of_sum(n::Int) = (n^2 * (n + 1)^2) ÷ 4

"Square the sum of the numbers up to the given number"
sum_of_squares(n::Int) = (n * (n + 1) * (2 * n + 1)) ÷ 6

"Subtract sum of squares from square of sums"
function difference(n::Int)::Int
    if n < 0 throw(DomainError("`n has to be non-negative`")) end
    # what do you think of short-circuiting?
    # n < 0 && throw(DomainError("`n has to be non-negative`"))
    square_of_sum(n) - sum_of_squares(n)
end

# just for fun
macro differ(n::Int)
    difference(n)
end
