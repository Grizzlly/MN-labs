A = [14 8 3; 8 5 2; 3 2 1];

n = size(A)(1);

L = zeros(size(A));
U = eye(size(A));

for p = 1 : n
	for i = 1 : p - 1
		U(i, p) = (A(i, p) - L(i, 1 : i) * U (1 : i, p)) / L(i, i);
	end

	for i = p : n
		L(i, p) = A(i, p) - L(i, 1 : i) * U(1 : i, p);
	end
end

disp(L);
disp(U);
disp(L * U);
