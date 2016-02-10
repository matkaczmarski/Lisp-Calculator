function [a b c d] = hermite_cubic_interpolate(x,y,dx,dy)

%  y = a*x*x*x + b*x*x + c*x + d
%  dy = 3A*x*X + 2*b*x + c
%
%tworzenie uk³adu równañ
[m n] = size(x);
A = [x.*x.*x; x.*x; x; ones(1,n)]';
[m n] = size(dx);
dA = [3*dx.*dx; 2*dx; ones(1,n); zeros(1,n)]';
A = [A ; dA];
b = [y' ; dy'];

% rozw ukladu rownian
p = A\b;
a = p(1); 
b = p(2);
c = p(3);
d = p(4);

end