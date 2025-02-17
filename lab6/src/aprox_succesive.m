function sol = aprox_succesive(x0, f, tol)
	while(1)
		sol = (-x0^3+2*x0^2+7)/5;
		if (abs(sol-x0)<tol && f(sol)<tol)
			break;
		endif;
		x0 = sol;
	endwhile
endfunction
