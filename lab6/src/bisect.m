f = @(x) x.^3 - 2*x - 5;
a = 2;
b = 3;
tol = 1e-10;

c = (a + b) / 2;
while abs(f(c)) > tol
	if f(a) * f(c) < 0
		b = c;
	else
		a = c;
	end
	c = (a + b) / 2;
end

disp(c);
disp(f(c));
