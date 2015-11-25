function [] = GeneralCantorSet(n, p)
    M = 0;

    for k=1:n
        
        M = [M,ones(1,p^(k-1)),M];
    end
    imagesc(M);
    colormap(gray);

    axis equal;
    axis off;
% 
%     x = [0, 1];
%     for i = 1:n
%         b_old = x;
%         b = reshape(b_old, 2, []);
%         l = ones(1, 2) * i;
%         for k = 1:size(b, 2)
%             plot(b(:, k), l, 'k-'), hold on
%         end
%         x_new = [];
%         for j = 1:size(b, 2)
%                 x1 = b(1,j);
%                 x2 = b(2,j);
%                 d = (x2 - x1) / 3.;
%                 x_new = [x_new, x1, x1 + d, x1 + d + d, x2];
%         end
%         x = x_new;
%     end
%     xlim([-0.1 1.1]), ylim([0 n+1])
end