a = [0 -2 -3 -1];
b = [2 4 5 3];
c = [-1 -1 -2 0];
d = [5 6 7 8];

A = zeros(4, 4);
for i = 1 : 4
    A(i, i) = b(i);
    if i > 1
        A(i, i - 1) = a(i);
    end
    if i < 4
        A(i, i + 1) = c(i);
    end
end
disp(A);

n = length(d);

x = zeros(n, 1);

for i = 2 : n
    mu = a(i) / b(i - 1);
    b(i) = b(i) - mu * c(i - 1);
    d(i) = d(i) - mu * d(i - 1);
end

x(n) = d(n) / b(n);
for i = (n - 1) : -1 : 1
    x(i) = (d(i) - c(i) * x(i + 1)) / b(i);
end

disp(x);
disp(A * x);
