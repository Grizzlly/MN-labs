function [Q, R] = h1(A, semn)
  n = size(A)(1);

  Q = eye(n);
  R = A;

  for i = 1 : n - 1
    d = zeros(n, 1);
    d(i:n) = A(i:n, i);

    if (A(i, i) >= 0)
      d(i) = d(i) + semn * norm(A(i:n, i), 2);
    else
      d(i) = d(i) - semn * norm(A(i:n, i), 2);
    endif

    %d = d / norm(d);
    %H = eye(n) - 2 * d * d';
    H = eye(n) - 2 * d * d' /  (d' * d);

    R = H * R;
    A = H * A;
    Q = Q * H;
  end

end
