function [ params] = der_fractint(x, y, s, k)

%ile pktów braæ do interpolacji hermite'a
pointsPerHI = 2;


[xi,yi] = safif([x' y'], s, length(s), k)
[sortedX, sortIndex] = sort(xi);
sortedY = yi(sortIndex);
xi=sortedX;
yi=sortedY;

n = length(xi)-1;
pphi = pointsPerHI -1;
seg = floor(n/pphi);
rest = mod(n, pphi);

params = [];

prev_der_val = 0;
next_der_val = 0;
x_prev = 0;
y_prev = 0;
x_next = 0;
y_next = 0;
for i=1:seg
    ind = (i-1)*pphi;
    p=[];
    xtmp = [];
    ytmp = [];
    
    for j=1:pphi+1
        if j == pphi
            x_prev = xi(ind+j);
            y_prev = yi(ind+j);
        end
        xtmp=[xtmp,xi(ind+j)];
        ytmp=[ytmp,yi(ind+j)];
    end

    if i == 1
        x_next = xi(pointsPerHI+1);
        y_next = yi(pointsPerHI+1);
        
        %wyliczamy wartoœæ pochodnej dla punktu œrodkowego miêdzy seriami
        common_x = [x_prev, xtmp(end), x_next];
        common_y = [y_prev,ytmp(end),y_next];
        dx=[];
        dy=[];
        [a1 b1 c1 d1] = hermite_cubic_interpolate(common_x,common_y,dx,dy);     
        
        dx=[xtmp(end)]
        next_der_val = polyval(polyder([a1 b1 c1 d1]), xtmp(end));
        dy=[next_der_val]
        [a b c d] = hermite_cubic_interpolate(xtmp,ytmp,dx,dy);
        params = [params; xtmp(1), xtmp(pointsPerHI),a,b,c,d];
    elseif i == seg
               
        if rest ~= 0
            %ostatni segment przed rest:
            prev_der_val = next_der_val;
            x_next = xi(ind + pointsPerHI + 1);
            y_next = yi(ind + pointsPerHI + 1);
            
            %wyliczamy wartoœæ pochodnej dla punktu œrodkowego miêdzy seriami
            common_x = [x_prev, xtmp(end), x_next];
            common_y = [y_prev,ytmp(end),y_next];
            dx=[];
            dy=[];
            [a1 b1 c1 d1] = hermite_cubic_interpolate(common_x,common_y,dx,dy);
            
            dx=[xtmp(1),xtmp(end)];
            next_der_val = polyval(polyder([a1 b1 c1 d1]), xtmp(end));
            dy=[prev_der_val, next_der_val];
            [a b c d] = hermite_cubic_interpolate(xtmp,ytmp,dx,dy);
            params = [params; xtmp(1), xtmp(pointsPerHI),a,b,c,d];
            
            %dla rest
            xtmp = [];
            ytmp=[];
            for i=rest:-1:0
                xtmp = [xtmp, xi(length(xi)-i)];
                ytmp = [ytmp, yi(length(yi)-i)];
            end
            dx=[xtmp(1)];
            dy=[next_der_val];
            [a b c d] = hermite_cubic_interpolate(xtmp,ytmp,dx,dy);
            params = [params; xtmp(1), xtmp(end),a,b,c,d];
        else
            prev_der_val = next_der_val;
            dx=[xtmp(1)];
            dy=[prev_der_val];
            [a b c d] = hermite_cubic_interpolate(xtmp,ytmp,dx,dy);
            params = [params; xtmp(1), xtmp(pointsPerHI),a,b,c,d];
        end
    else
        prev_der_val = next_der_val;
        x_next = xi(ind + pointsPerHI + 1);
        y_next = yi(ind + pointsPerHI + 1);
        
        %wyliczamy wartoœæ pochodnej dla punktu œrodkowego miêdzy seriami
        common_x = [x_prev, xtmp(end), x_next];
        common_y = [y_prev,ytmp(end),y_next];
        dx=[];
        dy=[];
        [a1 b1 c1 d1] = hermite_cubic_interpolate(common_x,common_y,dx,dy);
               
        dx=[xtmp(1),xtmp(end)];
        next_der_val = polyval(polyder([a1 b1 c1 d1]), xtmp(end));
        dy=[prev_der_val, next_der_val];
        [a b c d] = hermite_cubic_interpolate(xtmp,ytmp,dx,dy);
        params = [params; xtmp(1), xtmp(pointsPerHI),a,b,c,d];
    end    
end




%xi
%yi
%params(:,1:2)

%rysowanie wykresu
plot(x,y,'ko',xi,yi,'r.')
hold on;
for i=1:size(params,1)
    p = params(i,:);
    xh=p(1):0.001:p(2);
    yh=polyval(p(3:end), xh);
    plot(xh, yh, 'b-');
    hold on;
end
end

