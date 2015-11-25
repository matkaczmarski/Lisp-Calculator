function [ ] = SierpinskisCarpet( n )
%SIERPINSKISCARPET n - liczba iteracji
    M = 0;
    for k=1:n
        M = [M,M,M;
             M,ones(3^(k-1)),M;
             M,M,M];
    end
    imagesc(M);
    colormap(copper);
    axis equal;
    axis off;
end

