function yi = SplineC2natural(x, y, xi)
	n = length(x);

	h(1:n-1) = x(2:n)-x(1:n-1);
	a(1:n) = y(1:n);
	
	% aa - vectorul subdiagonala
	aa(1:n-2) = h(1:n-2);
	aa = [aa 0];
	
	% bb - vectorul diagonala principala
	bb(1) = 1;
	bb(n) = 1;
	for i = 2 : n-1
		bb(i) = 2*(h(i-1)+h(i));
	end
	
	% cc - vectorul supradiagonala
	cc(1) = 0;
	cc(2:n-1) = h(2:n-1);
	
	% g - vectorul termenilor liberi
	g(1) = 0;
	g(n) = 0;
	for i = 2 : n-1
		g(i) = 3*(a(i+1)-a(i))/h(i)-3*(a(i)-a(i-1))/h(i-1);
	endfor
  
	% rezolvare sistem tridiagonal
	c = Thomas(aa, bb, cc, g);
  
	for i = 1 : n-1
		d(i) = (c(i+1)-c(i))/(3*h(i));
		b(i) = (a(i+1)-a(i))/h(i)-((2*c(i)+c(i+1))*h(i))/3;
	endfor
	
	for i = 2 : n
		if xi <= x(i)
			k = i-1;
			break;
		endif
	endfor
  
	yi = a(k)+(b(k)*(xi-x(k)))+(c(k)*(xi-x(k))^2)+(d(k)*(xi-x(k))^3); 
end