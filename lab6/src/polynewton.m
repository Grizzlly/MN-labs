function [x, converged] = polynewton(p, x0, max_iter, tol)
pder = polyder(p);
x = x0;
converged = false;

for i = 1:max_iter
	x_prev = x;
	x = x - polyval(p, x) / polyval(pder, x);

	if abs(x - x_prev) < tol
		converged = true;
		break;
	end
end

end
