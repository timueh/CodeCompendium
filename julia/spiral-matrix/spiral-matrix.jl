function spiral_matrix(n::Int)
    M = zeros(Int,n,n)
    dx::Int, dy::Int = 1, 0
    x::Int, y::Int = 1, 1
    for i in 1:n^2
        M[y,x] = i
        if any(z->z in [0,n+1],[x+dx,y+dy]) || M[y+dy,x+dx]>0
            dx, dy = turn_right!(dx,dy)
        else
        end
        x += dx
        y += dy
    end
    return M
end

function turn_right!(δx::Int,δy::Int)
    if δx==1 && δy==0
        0, 1
    elseif δx==0 && δy==1
        -1, 0
    elseif δx==-1 && δy==0
        0, -1
    elseif δx==0 && δy==-1
        1, 0
    end
end
