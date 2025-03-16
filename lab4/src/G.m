A = [1 3 1 9; 1 1 -1 1; 3 11 8 35];

[m, n] = size(A);
maxP = min(m, n);

for p = 1 : maxP
	T = eye(m);
	mu = A(p + 1 : m, p) / A(p, p);
	T(p + 1 : m, p) = -mu;

	A = T * A;
end

disp(A);
disp(A(1 : 3,1 : 3) \ A(:, 4));
