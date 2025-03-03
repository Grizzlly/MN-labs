A = [14 8 3; 8 5 2; 3 2 1];

[n, ~] = size(A);

L = zeros(n);

for p = 1 : n
	for i = p : n
		s = L(p, 1 : p) * L(i, 1 : p)';

		if i == p
			L(p, p) = sqrt(A(p, p) - s);
		else
			L(i, p) = (A(i, p) - s) / L(p, p);
		end
	end
end

disp(L);
disp(L * L');
