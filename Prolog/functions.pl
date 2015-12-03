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
    power(X,Iter,Xpower),
    Result is Result1 + Xpower / Factorial.
    
% --------------------------------------------------------
%NATURAL LOGARITHM: ln(x) = Result in Iter iterations, 0<x<2
ln(X,Result,0):-
    Result is 0.
ln(X,Result,Iter):-
    Iter > 0,
    Iter1 is Iter - 1,
    ln(X,Result1,Iter1),
    power(X-1,Iter,Xpower),
    power(-1,Iter+1, NegOneTerm),
    Result is Result1 + NegOneTerm * Xpower / Iter.


% --------------------------------------------------------
%SQUARE ROOT: sqrt(x) = Result in Iter iterations, for 0<x<2
sqrt(X,Result,0):-
    Result is 1.
sqrt(X,Result,Iter):-
    Iter > 0,
    Iter1 is Iter - 1,
    sqrt(X,Result1,Iter1),
    power(X-1,Iter,Xpower),
    power(-1,Iter, NegOneTerm),
    power(4,Iter,FourPower),
    factorial(2*Iter,TopFactorial),
    factorial(Iter,BottomFactorial),
    power(BottomFactorial,2,BottomFactorialPower),
    Result is Result1 + NegOneTerm * TopFactorial * Xpower / ((1-2*Iter)*BottomFactorialPower*FourPower).



% --------------------------------------------------------
%               RADIANS <-> DEGREES CONVERTER:
% RADIANS->DEGREES: r2d(r,d)
r2d(R,D):-
    D is R*180/pi.
% DEGREES->RADIANS: d2r(d,r)
d2r(D,R):-
    R is D*pi /180.
    
% --------------------------------------------------------
%SINE: sin(x) = Result in Iter iterations, for x in radians
%Execution example: d2r(60,R), sin(R,Res,10).
sin(X,Result,0):-
    Result is X.
sin(X,Result,Iter):-
    Iter > 0,
    Iter1 is Iter - 1,
    sin(X,Result1,Iter1),
    Factor is 2*Iter+1,
    power(X,Factor,Xpower),
    power(-1,Iter, NegOneTerm),
    factorial(Factor,Factorial),
    Result is Result1 + NegOneTerm*Xpower/Factorial.
    
% --------------------------------------------------------
%COSINE: cos(x) = Result in Iter iterations, for x in radians
%Execution example: d2r(60,R), cos(R,Res,10).
cos(X,Result,0):-
        Result is 1.
cos(X,Result,Iter):-
    Iter > 0,
    Iter1 is Iter - 1,
    cos(X,Result1,Iter1),
    Factor is 2*Iter,
    power(X,Factor,Xpower),
    power(-1,Iter, NegOneTerm),
    factorial(Factor,Factorial),
    Result is Result1 + NegOneTerm*Xpower/Factorial.
    
    
% --------------------------------------------------------
%HIPERBOLIC SINE: sinh(x) = Result in Iter iterations, for x in radians
%Execution example: d2r(60,R), sinh(R,Res,10).
sinh(X,Result,0):-
    Result is X.
sinh(X,Result,Iter):-
    Iter > 0,
    Iter1 is Iter - 1,
    sinh(X,Result1,Iter1),
    Factor is 2*Iter+1,
    power(X,Factor,Xpower),
    factorial(Factor,Factorial),
    Result is Result1 + Xpower/Factorial.

% --------------------------------------------------------
%HIPERBOLIC COSINE: cosh(x) = Result in Iter iterations, for x in radians
%Execution example: d2r(60,R), cosh(R,Res,10).
cosh(X,Result,0):-
        Result is 1.
cosh(X,Result,Iter):-
    Iter > 0,
    Iter1 is Iter - 1,
    cosh(X,Result1,Iter1),
    Factor is 2*Iter,
    power(X,Factor,Xpower),
    factorial(Factor,Factorial),
    Result is Result1 + Xpower/Factorial.
    
% --------------------------------------------------------
%ARCSINE: arcsin(x) = Result in Iter iterations, for |x|<=1
%Execution example: arcsin(0.5,Res,20),r2d(Res,D).
arcsin(X,Result,0):-
    Result is X.
arcsin(X,Result,Iter):-
    Iter > 0,
    Iter1 is Iter - 1,
    arcsin(X,Result1,Iter1),
    power(X,2*Iter+1,Xpower),
    power(4,Iter,FourPower),
    factorial(2*Iter,TopFactorial),
    factorial(Iter,BottomFactorial),
    power(BottomFactorial,2,BottomFactorialPower),
    Result is Result1 +  TopFactorial * Xpower / ((2*Iter+1)*BottomFactorialPower*FourPower).

% --------------------------------------------------------
%ARCCOSINE: arccos(x) = Result in Iter iterations, for |x|<=1
%Execution example: arccos(0.5,Res,20),r2d(Res,D).
arccos(X,Result,Iter):-
     arcsin(X,Res1,Iter),
     Result is pi /2 - Res1.
     
     
% --------------------------------------------------------
%ARCTANGENT: arctg(x) = Result in Iter iterations, for |x|<=1
%Execution example: arctg(1.0,Res,20),r2d(Res,D).
arctg(X,Result,0):-
    Result is X.
arctg(X,Result,Iter):-
    Iter > 0,
    Iter1 is Iter - 1,
    arctg(X,Result1,Iter1),
    power(X,2*Iter+1,Xpower),
    power(-1,Iter, NegOneTerm),
    Result is Result1 +  NegOneTerm * Xpower / (2*Iter+1).
    
% --------------------------------------------------------
%BINOMIAL COEFFICIENT: bc(t,b,Result) = Result in Iter iterations
bc(T,B,Result):-
    factorial(T,TopFactorial),
    factorial(B,Bottom1Factorial),
    factorial(T-B,Bottom2Factorial),
    Result is TopFactorial/(Bottom1Factorial*Bottom2Factorial).

%GENERALIZED BINOMIAL COEFFICIENT: gbc(t,b,Result) = Result in Iter iterations t-arbitrary
gbc(T,B,Result):-
    factorial(T,TopFactorial),
    factorial(B,BottomFactorial),
    factorial(T-B,Bottom2Factorial),
    Result is TopFactorial/(Bottom1Factorial*Bottom2Factorial).

gbctmp(T,K,Result):-
    K=0,
    Result is T;
    K>0
    gbctmp(T,K-1,Result1),
    Result is Result1 *(T-K+1).
    
% --------------------------------------------------------
%BINOMIAL: binomial(X,A,Result,Iter) = Result in Iter iterations  (1+x)^A for |x|<1, A in C
binomial(X,A,Result,0):-
    Result is 1.
binomial(X,A,Result,Iter):-
    Iter > 0,
    Iter1 is Iter - 1,
    binomial(X,A,Result1,Iter1),
    power(X,Iter,Xpower),
    gbc(A,Iter, BC),
    Result is Result1 + BC*Xpower.