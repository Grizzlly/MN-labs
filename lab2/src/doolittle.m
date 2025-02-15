A = [14 8 3; 8 5 2; 3 2 1];

n = size(A)(1);

L = eye(size(A));
U = zeros(size(A));

for p = 1 : n
  for i = 1 : p - 1
    L(p, i) = (A(p, i) - L(p, 1 : (i - 1)) * U(1 : (i - 1), i)) / U(i, i);
  end

  for i = p : n
    U(p, i) = A(p, i) - L(p, 1 : (i - 1)) * U(1 : (i - 1), i);
  end
end

disp(L);
disp(U);
disp(L * U);
