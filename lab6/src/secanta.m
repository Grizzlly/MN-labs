f = @(x) x.^3 - 2*x - 5;
x0 = 2;
x1 = 3;

max_iter = 1000;
tol = 1e-10;

for i = 1:max_iter
	x = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));

	if abs(x - x1) < tol
		break;
	end

	x0 = x1;
	x1 = x;
end

disp(x);
disp(f(x));
