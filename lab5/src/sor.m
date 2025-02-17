function [x, flag] = sor(A, x, b, w, max_it, tol)
	% 	Metoda Suprarelaxarii
	%   Functia rezolva sisteme liniare Ax=b folosind metoda suprarelaxarii
	% Input:
	%   A - matricea sistemului
	%   x - aproximarea intiala a sistemului
	%   b - vectorul termenilor liberi
	%   w - factorul de relaxare
	%   max_it - numarul maxim de iteratii
	%   tol - toleranta
	% Output:
	%   x - solutia sistemului
	%   flag - 0 = a fost gasita o solutie / 1 = metoda nu converge pentru max_it