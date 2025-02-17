function sol = secanta(a, b, f, tol)
	m = 0;
	while(((b-a)/(2^m)) > tol)
		sol = (a*f(b)-b*f(a))/(f(b)-f(a));
		if (f(a)*f(sol) < 0)
			b = sol;
		elseif (f(sol)*f(b) < 0)
			a = sol;
		endif
		m = m+1;
	endwhile
endfunction
