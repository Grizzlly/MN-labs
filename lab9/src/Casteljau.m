function P = Casteljau(x, y, t)
	n = length(x);
	
	plot(x, y, 'k-o');
	legend ('puncte de control');
	hold on;
	axis([0.5, 4.5, 0.2, 2.1]);

	for j = 1 : n-1
		for i = 1 : n-j 
			x(i) = (1-t)*x(i)+t*x(i+1);
			y(i) = (1-t)*y(i)+t*y(i+1);
		endfor
		
		plot(x(1:n-j), y(1:n-j), 'r-*');
	endfor
	
	P =[x(1) y(1)];
endfunction