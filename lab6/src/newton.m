f = @(x) x.^3 - 2*x - 5;
fder = @(x) 3*x^2 - 2;
x0 = 2;

max_iter = 1000;
tol = 1e-10;
x = x0;

for i = 1:max_iter
	x_prev = x;
	x = x - f(x) / fder(x);

	if abs(x - x_prev) < tol
		break;
	end
end

disp(x);
disp(f(x));
