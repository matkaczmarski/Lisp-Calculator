x = [0 5 8 10];
y = [5 2 4 1];
s = [0.5 0.7 0.5];

[params] = der_fractint(x, y, s, 4);
%plot(x,y)
%[xi, yi] = safif([x' y'], s, 3, 4);
%plot(xi,yi,'ko',xi,yi,'r.')
%hold on
%plot(xi, yi)