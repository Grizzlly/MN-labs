A = [14 8 3; 8 5 2; 3 2 1];

n = size(A)(1);

L = zeros(n);

for p = 1 : n
	for i = 1 : p
		s = L(p, 1 : i) * L(i, 1 : i)';

    	if i == p
    		L(p, p) = sqrt(A(p, p) - s);
    	else
    		L(p, i) = (A(p, i) - s) / L(i, i);
    	end
	end
end

disp(L);
disp(L * L');
