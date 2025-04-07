M = [0 0 0 .25; 0 0 0 .5; 1 0.5 0 .25; 0 0.5 1 0];
d = 0.85;
tol = 1e-10;

[n, ~] = size(M);

v = ones(n, 1);
G = d * M + ((1 - d) / n) * ones(n, n);

while true
	v_prev = v;

	v = G * v;
	v = v / norm(v);

	if norm(v - v_prev) < tol
		break;
	end
end

v = v / norm(v, 1);

disp(eigenv);
disp(v);
