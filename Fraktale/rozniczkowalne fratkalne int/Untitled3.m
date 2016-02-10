x = 1:20;
y = zeros(1,20);
for i=1:20
    if mod(i, 2) == 1
        y(i) = 1;
    else
        y(i) = 5;
    end
end

hp = hermite(x,y,zeros(1,20));
%polyval(hp)


x_1 = 1:0.1:20;
y_1 = polyval(hp, x_1);


plot(x_1, y_1)
