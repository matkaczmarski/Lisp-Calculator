x = [0 5 8 10];
y = [5 2 4 1];
s = [0.5 0.7 0.5];

%[params] = der_fractint(x, y, s, 4);
%plot(x,y)
[xi, yi] = safif([x' y'], s, 3, 9);

xp = linspace(0,10,100000000);
yp = interp1(xi, yi, xp, 'spline');
plot(xp,yp)

%pp = spline(xi, yi);
%cs = csapi(xi, yi);
%fnplt(cs, 2);
%axis([0 10 0 7])

%x_1 = linespace(0, 10, 1000);
%y_1 = ppval(pp, x_1);

%plot(x_1, ppval(pp, x_1))
%plot(xi,yi,'ko',xi,yi,'r.')
%hold on
%plot(xi, yi)