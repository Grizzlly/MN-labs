A = [14 8 3; 8 5 2; 3 2 1];
b = [9; 1; 35];
x = 0;
r = b;
p = r;

max_iter = 1000;
tol = 1e-10;

for i = 1:max_iter
	ap = A * p;
	pap = p' * ap;
	rr = r' * r;

	alpha = rr / pap;
	x = x + alpha * p;
	r = r - alpha * ap;

	if norm(r) < tol
		break;
	end

	beta = (r' * r) / rr;

	p = r + beta * p;
end

disp(x);
disp(A * x - b);
