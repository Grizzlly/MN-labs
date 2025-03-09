function [x] = polygo(p, a, b)
  x = polyint(p);
  x = ployval(x, b) - polyval(x, a);
end

