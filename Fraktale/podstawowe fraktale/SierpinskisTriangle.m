function SierpinskisTriangle(A, B, C, n)
%SIERPINSKISTRIANGLE A,B,C - punkty trójk¹ta, n - liczba iteracji
%pierwsze wywo³anie nalepiej dla A=[0,0] B=[1,0] C=[1/2,sqrt(3)/2]
%SierpinskisTriangle([0 0], [1 0], [1/2,sqrt(3)/2], 5)
patch([A(1), B(1), C(1)], [A(2), B(2), C(2)], [0.0 0.0 0.0], 'black');
  if (n > 0)
    AB = (A + B) / 2;
    AC = (A + C) / 2;
    BC = (B + C) / 2;
    SierpinskisTriangleRec(A, AB, AC, n);
    SierpinskisTriangleRec(B, AB, BC, n);
    SierpinskisTriangleRec(C, AC, BC, n);
  end
end

function SierpinskisTriangleRec(A, B, C, n)
  if (n > 0)
    AB = (A + B) / 2;
    AC = (A + C) / 2;
    BC = (B + C) / 2;
    SierpinskisTriangleRec(A, AB, AC, n-1);
    SierpinskisTriangleRec(B, AB, BC, n-1);
    SierpinskisTriangleRec(C, AC, BC, n-1);
  else
    patch([A(1), B(1), C(1)], [A(2), B(2), C(2)], [0.0 0.0 0.0], [0.9290 0.6940 0.1250]);
  end
end