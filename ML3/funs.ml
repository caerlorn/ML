(* Yıldırım Can Şehirlioğlu
*  080 302 010
*  COMPE 325 HW3 *)

type term = int*int;

structure deriv = 
	struct
		  local
			   fun f2((x,y):term) = (x*y, y-1);
			   
			   fun f4(a:term) =    if (#1 a = 0 orelse #2 a = ~1) then ""
								   else if #2 a = 0 then Int.toString(#1 a)
							       else if #2 a = 1 then Int.toString(#1 a) ^ "x"
                                   else Int.toString(#1 a) ^ "x" ^ Int.toString(#2 a);
				
			   fun f3(h::nil) = f4 h | f3(h::t:term list) =  
								   if (#1 h = 0 orelse #2 h = ~1) then f3(t) 
								   else if #2 h = 0 then Int.toString(#1 h)
								   else if #2 h = 1 then Int.toString(#1 h) ^ "x" ^ " " ^ "+" ^ " " ^ f3(t)
                                   else Int.toString(#1 h) ^ "x" ^ Int.toString(#2 h) ^ " " ^ "+" ^ " " ^ f3(t) 
				|  f3 _ = "The list you have entered cannot be reached at the moment.";    
		   in
			   fun deriva(h) = f3(map f2 h);		
		   end
	end;


val poly:term list=[(2,3),(4,1),(5,0)];
val poly2:term list=[(8,0),(2,9),(4,~8),(5,7),(0,5),(3,6),(5,0),(9,5),(6,~4),(15,3),(12,2),(1,1),(60,0)];
val poly3:term list=[(4,2)];
val poly4 = [];

deriv.deriva(poly);

deriv.deriva(poly2);

deriv.deriva(poly3);

deriv.deriva(poly4);