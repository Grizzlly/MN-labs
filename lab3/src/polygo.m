a0 = [0, 0, 0, 1];
p0 = a0;

a1 = [0, 0, 1, 0];
p1 = a1 - p0 * (polydot(a1, p0) / polydot(p0, p0));
p1 = p1 / polyval(p1, 1);

a2 = [0, 1, 0, 0];
p2 = a2 - p0 * (polydot(a2, p0) / polydot(p0, p0)) ...
        - p1 * (polydot(a2, p1) / polydot(p1, p1));
p2 = p2 / polyval(p2, 1);

a3 = [1, 0, 0, 0];
p3 = a3 - p0 * (polydot(a3, p0) / polydot(p0, p0)) ...
        - p1 * (polydot(a3, p1) / polydot(p1, p1)) ...
        - p2 * (polydot(a3, p2) / polydot(p2, p2));
p3 = p3 / polyval(p3, 1);

x = linspace(-1, 1, 100);
hold on;
ylim([-1.05, 1.05]);
plot(x, polyval(p0, x), '-');
plot(x, polyval(p1, x), '-');
plot(x, polyval(p2, x), '-');
plot(x, polyval(p3, x), '-');
hold off;
