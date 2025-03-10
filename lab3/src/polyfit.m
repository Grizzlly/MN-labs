
f = @(x) exp(x);
prod = @(p, f, x) polyval(p, x) .* f(x);
polydot1 = @(f, p) integral(@(x) prod(p, f, x), -1, 1);
polydot2 = @(p1, p2) integral(@(x) polyval(p1, x) .* polyval(p2, x), -1, 1);

pp = {p0; p1; p2; p3};

c = zeros(length(pp), 1);
for i = 1 : length(pp)
    c(i) = polydot1(f, pp{i}) / polydot2(pp{i}, pp{i});
end

respoly = cellfun(@(p, ci) ci * p, pp, num2cell(c), 'UniformOutput', false);
res = sum(cell2mat(respoly), 1);

clf;
hold on;
x = linspace(-1, 1, 100);

plot(x, polyval(res, x), '-');
plot(x, f(x), '-');
legend('poly', 'f');

hold off;
