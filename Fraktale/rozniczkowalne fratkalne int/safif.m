%IP is a N+1x2 matrix representing the interpolation points
%N is the number of mappings and N+1 the number of points
%S is a Nx1 matrix representing the contraction factors
%steps: is the number of iterations
%The algorithm computes and returns N^(steps+1)+1 points
%representing the attractor of the FIF.
function [xi, yi] =safif(IP,S,N,steps)
    %Here are the map parameters.
    for i=1:N
        a(i)=(IP(i+1,1)-IP(i,1))/(IP(N+1,1)-IP(1,1));
        e(i)=(IP(N+1,1)*IP(i,1)-IP(1,1)*IP(i+1,1))/(IP(N+1,1)-IP(1,1));
        c(i)=(IP(i+1,2)-IP(i,2))/(IP(N+1,1)-IP(1,1))-S(i)*(IP(N+1,2)-IP(1,2)) /(IP(N+1,1)-IP(1,1));
        f(i)=(IP(N+1,1)*IP(i,2)-IP(1,1)*IP(i+1,2))/(IP(N+1,1)-IP(1,1))-S(i)*(IP(N+1,1)*IP(1,2)-IP(1,1)*IP(N+1,2))/(IP(N+1,1)-IP(1,1));
    end;
    A_0=IP;
    points=N+1;
    for i=1:steps
        i
        %for each section
        l=1;
        for j=1:N
            %map all the points to the section j
            for k=1:points-1
                P(l,1)=a(j)*A_0(k,1)+e(j);
                P(l,2)=c(j)*A_0(k,1)+S(j)*A_0(k,2)+f(j);
                l=l+1;
            end;
        end;
        P(l,1)=A_0(points,1);
        P(l,2)=A_0(points,2);
        points=l;
        A_0=P;
    end;
    
    xi = P(:,1);
    yi = P(:,2);
    %plot(P(:,1),P(:,2));
end