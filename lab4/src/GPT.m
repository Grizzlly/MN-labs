A = [1 3 1 9; 1 1 -1 1; 3 11 8 35];

[m, n] = size(A);
maxP = min(m, n);

rightPerms = eye(n);

for p = 1 : maxP
	[~, idx] = max(A(p : m, p : n - 1), [], "all", "ComparisonMethod", "abs");
	[row, col] = ind2sub(size(A(p : m, p : n - 1)), idx);
	row = row + p - 1;
	col = col + p - 1;

	P = eye(n);
	P(p, p) = 0;
	P(col, col) = 0;
	P(p, col) = 1;
	P(col, p) = 1;
  
	rightPerms = rightPerms * P;
	A = A * P;

	P = eye(m);
	P(p, p) = 0;
	P(row, row) = 0;
	P(p, row) = 1;
	P(row, p) = 1;

	A = P * A;

	T = eye(m);
	mu = A(p + 1 : m, p) / A(p, p);
	T(p + 1 : m, p) = -mu;

	A = T * A;
end

disp(A);
disp(rightPerms(1 : 3, 1 : 3) * (A(1 : 3,1 : 3) \ A(:, 4)));
