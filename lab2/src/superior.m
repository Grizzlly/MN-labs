A = [14 8 3; 0 5 2; 0 0 1];
b = [1; 2; 3];

n = size(A)(1);

x = zeros(n, 1);

for i = n : -1 : 1
	x(i) = (b(i) - A(i, (i + 1) : n) * x((i + 1) : n)) / A(i, i);
end

disp(x);
disp(A * x);
