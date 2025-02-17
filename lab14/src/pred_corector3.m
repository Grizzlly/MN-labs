function y = pred_corector3(a, b, n, y0, f)
	y = Runge_Kutta4(a, b, n, y0, f);
	h = (b-a)/n;
	x(1:n+1) = a+h*[0:n];
	
	for i = 3 : n
		aux1 = feval(f, x(i), y(i));
		aux2 = feval(f, x(i-1), y(i-1));
		aux3 = feval(f, x(i-2), y(i-2));
		ypr = y(i)+h/12*(23*aux1-16*aux2+5*aux3);
		ycor = y(i)+h/12*(5*feval(f, x(i+1), ypr)+8*aux1-aux2);
		y(i+1) = ycor;		
	endfor
endfunction

