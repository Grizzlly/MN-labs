	x = -pi : pi/17 : pi;
	f = @(x) 7*(x.^2) + x + 1;
	
	for i = 1 : length(x)
		y0(i) = PolinomTrigonometric(2, x(i), f);
	endfor
	
	plot(x, f(x), 'r-o', x, y0, 'k-*');
	axis([-3.5 3.5 -5 85]);
	legend ('y = f(x)', 'y = S_{2}(x)');
