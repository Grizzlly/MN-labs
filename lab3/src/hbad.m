clc; clear;
format long;

delta = [1e-16, 1e-15, 1e-14, 1e-13, 1e-12, 1e-11, 1e-10, 1e-9, 1e-8, 1e-7, 1e-6, 1e-5, 1e-4, 1e-3, 1e-2, 1e-1];

points_good = zeros(length(delta), 1);
points_bad = points_good;
points_ref = points_good;

first_cols = zeros(3, length(delta));

for i = 1 : length(delta)
  first_cols(:, i) = [1, delta(i), 0];
end

matrices = zeros(3, 3, length(delta));

tests = 1000;
g = zeros(tests, 1);
b = zeros(tests, 1);

for j = 1 : tests

startmat = rand(3);

for i = 1 : length(delta)
  M = startmat;
  M(:, 1) = first_cols(:, i);
  matrices(:, :, i) = M;
end

for i = 1 : length(delta)
  currmat = squeeze(matrices(:, :, i));
  [q, r] = qr(currmat);
  points_ref(i) = norm(currmat - q * r, 2) / norm(currmat);
end

for i = 1 : length(delta)
  currmat = squeeze(matrices(:, :, i));
  currmat;
  [q, r] = h1(currmat, -1);
  points_good(i) = norm(currmat - q * r) / norm(currmat);
end

for i = 1 : length(delta)
  currmat = squeeze(matrices(:, :, i));
  [q, r] = h1(currmat, 1);
  points_bad(i) = norm(currmat - q * r) / norm(currmat);
end

g(j) = mean(points_good);
b(j) = mean(points_bad);

end

%g = g .* 1e+16;
%b = b .* 1e+16;
tests = 1 : tests;
plot(tests, g, 'b-', tests, b, 'r-');
mean(g - b)

%delta = delta .* 1e+16;
%delta = log10(delta);
%plot(delta, points_good, '+', delta, points_bad, 'o', delta, points_ref, '*');
