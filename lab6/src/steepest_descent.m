A = [14 8 3; 8 5 2; 3 2 1];
b = [9; 1; 35];
x = 0;
r = b;

max_iter = 1000;
tol = 1e-10;

for i = 1:max_iter
	if norm(r) < tol
		break;
	end

	ar = A * r;
	alpha = (r' * r) / (r' * ar);
	x = x + alpha * r;
	r = r - alpha * ar;
end

disp(x);
disp(A * x - b);
