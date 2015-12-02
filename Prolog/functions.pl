setMaximumIterations(Iterations):-
    Iterations is 20.
% --------------------------------------------------------
%FACTORIAL/SILNIA: x! = Result
factorial(0,Result) :-
    Result is 1.
factorial(X,Result) :-
    X > 0,
    X1 is X-1,
    factorial(X1,Result1),
    Result is Result1*X.

% --------------------------------------------------------
%POWER/POTÊGOWANIE: x^y = Result
power(X,0,Result):-
    Result is 1.
power(X,Y,Result):-
    Y > 0,
    Y1 is Y - 1,
    power(X,Y1,Z),
    Result is Z*X.

% --------------------------------------------------------
%EXPONENTIAL: e^x = Result in Iter iterations
exp(X,Result,0):-
        Result is 1.
exp(X,Result,Iter):-
    Iter > 0,
    Iter1 is Iter - 1,
    exp(X,Result1,Iter1),
    factorial(Iter,Factorial),
    power(X,Iter,Power),
    Result is Result1 + Power / Factorial.