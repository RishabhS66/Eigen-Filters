function [P,A,B]=eigmakemat(wp,ws,M)
% Computes 3 matrices P,A and B needed for calculating the coefficients of
% eigenfilter
% -----------------------------------------------------------
% wp = passband frequency, ws = stopband frequency
% M = number of coefficients (should be 'odd')
% For phi = [1 cos(w) cos(2w) ... cos((M-1)w/2)]'
% P = integral(phi) over limits 0 to wp
% A = integral(phi * phi') over limits 0 to wp
% B = integral(phi * phi') over limits ws to pi

N=(M-1)/2;
P=zeros(N+1,1);
for i=1:N+1
    func = @(x) cos(x*(i-1));
    P(i,1)=integral(func,0,wp);
end
A=zeros(N+1,N+1);
for i=1:N+1
    for j=1:N+1
        func1 = @(y) cos(y*(i-j))/2;
        func2 = @(z) cos(z*(i+j-2))/2;
        A(i,j)=integral(func1,0,wp)+integral(func2,0,wp);
    end
end
B=zeros(N+1,N+1);
for i=1:N+1
    for j=1:N+1
        func3 = @(a) cos(a*(i-j))/2;
        func4 = @(b) cos(b*(i+j-2))/2;
        B(i,j)=integral(func3,ws,pi)+integral(func4,ws,pi);
    end
end
