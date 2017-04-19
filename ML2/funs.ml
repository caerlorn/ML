type sinfo = {name:string,country:string,scores:real list};

type skater = string*string*real;

fun sum(nil):real = 0.0 | sum(h::t:real list):real = (h + sum(t));

fun avg(nil):real = 0.0 | avg(h::t:real list):real = sum(h::t) / 5.0;
	
fun convert(nil) = nil | convert(h::t:sinfo list):skater list = ((#name h),(#country h),(avg(#scores h)))::convert(t);

fun max(h::nil) = h | max(h::t::z:skater list):skater = if (#3 h) > (#3 t) then max(h::z) else max(t::z);
	
fun removem1(x, nil) = nil | removem1(x:skater, (h::t:skater list)):skater list = if ((#1 x = #1 h) andalso (#2x = #2h)) then t else (h::removem1(x, t));

fun findmax2(h::t:skater list) = (max(h::t) , max(removem1((max(h::t)),(h::t))));