A = [10 -5 1; 1 4 3; 4 -3 -9];
b = [1; 4; 6];

max_iter = 1000;
tol = 1e-6;

x = zeros(length(b), 1);

for i = 1 : max_iter
	x_prev = x;
	for j = 1 : length(x)
		x(j) = (b(j) - A(j, 1:j-1) * x(1:j-1) - A(j, j+1:end) * x(j+1:end)) / A(j, j);
	end
	if norm(x - x_prev) < tol
		break;
	end
end

disp(x);
disp(A * x);
