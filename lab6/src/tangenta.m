function sol = tangenta(x0, f, fd, tol)
	while(1)
		sol = x0-f(x0)/fd(x0);
		if (abs(sol-x0) < tol && f(sol) < tol)
			break;
		endif;
		x0 = sol;
	endwhile
endfunction
