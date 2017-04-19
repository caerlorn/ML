fun f1(h::t, 0) = nil | f1(nil, n) = nil | f1(h::t, n) = f1(t,n-1) @ [h];


fun f2(nil,nil) = nil | f2(_,nil) = nil  | f2(nil,d) =  f2([0],d) | f2(a::b, c::d) = a:: f2(b,d);