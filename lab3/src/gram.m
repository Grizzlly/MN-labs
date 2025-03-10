A = [14 8 3; 8 5 2; 3 2 1];

[~, n] = size(A);

R = zeros(n);
Q = A;
Q(:, 1) = A(:, 1) / norm(A(:, 1));
R(1, :) = Q(:, 1)' * A;

for i = 1 : n - 1
	for j = i + 1 : n
		Q(:, j) = Q(:, j) - (Q(:, j)' * Q(:, i)) * Q(:, i);
	end

	Q(:, i + 1) = Q(:, i + 1) / norm(Q(:, i + 1));
	R(i + 1, :) = Q(:, i + 1)' * A;
end

% OPTIONAL - pt o vizualizare mai buna
for i = 1 : n
	for j = 1 : n
		if abs(R(i, j)) < 0.001
			R(i, j) = 0;
		end
	end
end

disp(Q);
disp(R);
disp(Q * R);
disp(Q * Q');
