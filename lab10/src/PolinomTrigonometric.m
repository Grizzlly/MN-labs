function rez = PolinomTrigonometric(m, x0, f)
	x = -pi+(0 : 2*m-1)/m*pi;
	y = f(x);
	
	for k = 0 : m
		suma = y(1 : 2*m)*cos(k*x(1 : 2*m))';
		a(k+1) = (1/m)*suma;
	endfor
	
	for k = 1 : m-1
		suma = y(1 : 2*m)*sin(k*x(1 : 2*m))';
		b(k) = (1/m)*suma;
	endfor
	
	suma1 = a(2:m)*cos((1 : m-1)*x0)';
	suma2 = b(1 : m-1)*sin((1 : m-1)*x0)';
	rez = a(1)/2+(a(m+1)/2)*cos(m*x0)+suma1+suma2;
endfunction
