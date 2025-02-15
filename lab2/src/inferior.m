A = [14 0 0; 8 5 0; 3 2 1];
b = [1; 2; 3];

n = size(A)(1);

x = zeros(n, 1);

for i = 1 : n
	x(i) = (b(i) - A(i, 1 : (i - 1)) * x(1 : (i - 1))) / A(i, i);
end

disp(x);
disp(A * x);
