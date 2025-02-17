function [lambda y iter] = PutereDir(A, y, maxIter, eps)
	iter = maxIter;
	
	while maxIter > 0
		maxIter--;
		z = A*y;
		y = z/norm(z);
		lambda = y'*A*y;
		
		if norm(A*y-lambda*y)<eps
			break;
		endif
	endwhile
	
	iter = iter-maxIter;
endfunction