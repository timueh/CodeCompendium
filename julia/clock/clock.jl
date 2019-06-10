import Base: show, +, -, isequal
import Dates

struct Clock
    h::Integer
    m::Integer
    function Clock(h::Integer,m::Integer)
        h, m = set_mins(h,m)
        new(set_hrs(h),m)
    end
end

function set_mins(h::Integer,m::Integer)
    while !(0 <= m <= 59)
        Δh = set_component(m,60)
        h += Δh
        m -= Δh*60
    end
    h, m
end

function set_hrs(h::Integer)
    while !(0 <= h <= 23)
        Δh = set_component(h,24)
        h -= Δh*24
    end
    h
end

function set_component(x::Integer,N::Integer)
    Δx = x >= 0 ? div(x,N) : div(x,N)-1
end

function show(io::IO,c::Clock)
    h, m = map(x->0 <= x <= 9 ? "0"*string(x) : string(x), [c.h, c.m])
    print(io, "\""* h*":"*m * "\"")
end

+(c::Clock,m::Dates.Minute) = Clock(c.h,c.m + m.value)
+(c::Clock,(h,m)::Tuple{Integer,Integer}) = Clock(c.h + h,c.m + m)

-(c::Clock,m::Dates.Minute) = Clock(c.h,c.m - m.value)
-(c::Clock,(h,m)::Tuple{Integer,Integer}) = Clock(c.h - h,c.m - m)

isequal(c1::Clock,c2::Clock) = c1.m == c2.m && c1.h == c2.h
