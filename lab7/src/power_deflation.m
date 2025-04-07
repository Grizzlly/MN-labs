A = [14 8 3; 8 5 2; 3 2 1];

tol = 1e-10;
max_iter = 1000;

eigarray = zeros(n, 1);

while size(A, 1) > 0
	v = ones(size(A, 1), 1);
	v = v / norm(v);

	while true
		v_prev = v;
		v = A * v;
		v = v / norm(v);
		if norm(v - v_prev) < tol
			break;
		end
	end

	eig_current = v' * A * v;
	eigarray(size(A, 1)) = eig_current;

	y = A(1, :) / (eig_current * v(1));
	A = A - eig_current * (v * y);

	A = A(2:end, 2:end);
end

disp(eigarray);
