function [lambda y iter] = PutereInv(A, y, lambda, maxIter, eps)
	n = size(A, 1);
	iter = maxIter;
	
	while maxIter > 0
		maxIter--;
		z = inv(A-lambda*eye(n))*y;
		y = z/norm(z);
		lambda = y'*A*y;
		
		if norm(A*y-lambda*y)<eps
			break;
		endif
	endwhile
	
	iter = iter-maxIter;
endfunction