A = [1 3 1 9; 1 1 -1 1; 3 11 8 35];

[m, n] = size(A);
maxP = min(m, n);

for p = 1 : maxP
    s_factors = max(A(p : m, p : n - 1), [], 2, "ComparisonMethod", "abs");
    fractions = A(p : m, p) ./ s_factors;
    [~, idx] = max(fractions, [], "ComparisonMethod", "abs");
    idx = idx + p - 1;  % ne trebuie index-ul din toata coloana,
                        % nu doar de la p : m

    P = eye(m);
    P(p, p) = 0;
    P(idx, idx) = 0;
    P(p, idx) = 1;
    P(idx, p) = 1;

    A = P * A;

    T = eye(m);
    mu = A(p + 1 : m, p) / A(p, p);
    T(p + 1 : m, p) = -mu;

    A = T * A;
end

disp(A);
