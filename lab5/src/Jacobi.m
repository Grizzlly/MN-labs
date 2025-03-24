A = [10 -5 1; 1 4 3; 4 -3 -9];
b = [1; 4; 6];

D = diag(diag(A));
L = -tril(A, -1);
U = -triu(A, 1);

G = D \ (L+U);
c = D \ b;

max_iter = 1000;
tol = 1e-6;

x = zeros(length(b), 1);

for i = 1 : max_iter
	x_prev = x;
	x = G * x + c;
	if norm(x - x_prev) < tol
		break;
	end
end

disp(x);
disp(A * x);
