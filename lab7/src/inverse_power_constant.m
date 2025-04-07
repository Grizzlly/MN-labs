A = [14 8 3; 8 5 2; 3 2 1];
v = [1; 1; 1];
v = v / norm(v);

mu = 1;
tol = 1e-10;
max_iter = 1000;

for i = 1 : max_iter
	v_prev = v;

	v = (A - mu * eye(length(v))) \ v;
	v = v / norm(v);

	if norm(v - v_prev) < tol
		break;
	end
end

eigenv = v' * A * v;

disp(eigenv);
disp(v);
