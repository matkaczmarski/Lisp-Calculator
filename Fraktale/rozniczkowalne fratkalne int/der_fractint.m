function [ params] = der_fractint(x, y, s, k)

%ile pktów braæ do interpolacji hermite'a
pointsPerHI = 4;

% tu coœ zmieniæ, bo jest œrednio ok
[xi,yi] = safif([x' y'], s, length(s), k)
[sortedX, sortIndex] = sort(xi);
sortedY = yi(sortIndex);
xi=sortedX;
yi=sortedY;
% koniec zmian

n = length(xi)-1;
pphi = pointsPerHI -1;
seg = floor(n/pphi);
rest = mod(n, pphi);

params = [];

for i=1:seg
    ind = (i-1)*pphi;
    p=[];
    xtmp = [];
    ytmp = [];
    
    for j=1:pphi+1
        xtmp=[xtmp,xi(ind+j)];
        ytmp=[ytmp,yi(ind+j)];
    end

    if i == 1
        dx=[];
        dy=[];
        [a b c d] = hermite_cubic_interpolate(xtmp,ytmp,dx,dy);
        params = [params; xtmp(1), xtmp(pointsPerHI),a,b,c,d];
    else
        dx=[xtmp(1)];
        prev_params=params(size(params,1),:);
        der_x1=polyder(prev_params(pphi:end));
        dy=[polyval(der_x1, xtmp(1))];
        [a b c d] = hermite_cubic_interpolate(xtmp,ytmp,dx,dy);
        params = [params; xtmp(1), xtmp(pointsPerHI),a,b,c,d];
    end    
end


if rest ~= 0
    xtmp = [];
    ytmp=[];
    for i=rest:-1:0
        xtmp = [xtmp, xi(length(xi)-i)];
        ytmp = [ytmp, yi(length(yi)-i)];
    end
    dx=[xtmp(1)]
    prev_params=params(size(params,1),:)
    der_x1=polyder(prev_params(3:end));
    dy=[polyval(der_x1, xtmp(1))];
    [a b c d] = hermite_cubic_interpolate(xtmp,ytmp,dx,dy);
    params = [params; xtmp(1), xtmp(end),a,b,c,d];
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

