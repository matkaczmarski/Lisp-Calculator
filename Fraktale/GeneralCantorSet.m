function [ ] = GeneralCantorSet( iter, part )

    if part <= 0 || part >= 1
        sprintf('Nieprawid³owa wartoœæ zmiennej part!')
        return
    end
    x = [0, 1];
    for i = 1:iter
        b_old = x;
        b = reshape(b_old, 2, []);
        l = ones(1, 2) * i;
        for k = 1:size(b, 2)
            plot(b(:, k), l, 'ro-'), hold on
        end
        x_new = [];
        for j = 1:size(b, 2)
                x1 = b(1,j);
                x2 = b(2,j);
                d = ((x2 - x1) - (x2 - x1) .* part) / 2;
                x_new = [x_new, x1, x1 + d, x2 - d, x2];
        end
        x = x_new;
    end
    xlim([-0.1 1.1]), ylim([0 iter+1])

end