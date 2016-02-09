function [] = Koch(n, flake)
%KOCH n - liczba iteracji, flake - czy wyœwietliæ w formie p³atka œniegu
    if flake 
        %p³atek œniegu:
        kochFragment([1,0], [0,0], n);
        kochFragment([0,0], [1/2,sqrt(3)/2], n);
        kochFragment([1/2,sqrt(3)/2], [1,0], n);
        axis equal
    else
        kochFragment([0,0], [1,0], n);
        axis equal
    end
end

function kochFragment(A, E, n)
    if (n > 0)
        B = [(2 * A(1) + E(1)) / 3,(2 * A(2) + E(2)) / 3];
        C = [(A(1) + E(1)) / 2 - (E(2) - A(2)) / (2.0 * sqrt(3.0)),(A(2) + E(2)) / 2 + (E(1) - A(1)) / (2.0 * sqrt(3.0)) ];
        D = [(2 * E(1) + A(1)) / 3, (2 * E(2) + A(2)) / 3];
        kochFragment(A, B, n-1);
        kochFragment(B, C, n-1);
        kochFragment(C, D, n-1);
        kochFragment(D, E, n-1);
    else
        x = [A(1);E(1)];
        y = [A(2);E(2)];
        line(x, y, 'Color', 'k');
    end
end
