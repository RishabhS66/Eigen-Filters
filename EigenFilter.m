% To design a Eigenfilter (low pass) for desired parameters, for different filter lengths  
% Code by - Rishabh Srivastava

% The low pass causal, symmetric filter to be designed has 'odd' number of
% coefficients (filter length)
% It is a Type-1 FIR Eigenfilter

%The coefficient matrix 'a' of the filter can be obtained by solving the equation :
%alpha * P' = a' * (alpha*A + beta*B)

clc;
clear;

wp = 0.3*pi; %Passband Frequency
ws = 0.4*pi; %Passband Frequency
%Weight parameters
alpha=1;
beta=1;

HR=zeros(501,5);
%% M=15 is the number of coefficients
M=15;
[P,A,B]=eigmakemat(wp,ws,M); %To get the 3 matrices P,A and B
C=alpha*A+beta*B;
C_t=C';
a=C_t\P;
[Hr,omega] = Hr_Type1_eigfil(a); %Hr is the designed filter

HR(:,1)=Hr;
%% M=19 is the number of coefficients
M=19;
[P,A,B]=eigmakemat(wp,ws,M); %To get the 3 matrices P,A and B
C=alpha*A+beta*B;
C_t=C';
a=C_t\P;
[Hr,omega] = Hr_Type1_eigfil(a); %Hr is the designed filter

HR(:,2)=Hr;
%% M=23 is the number of coefficients
M=23;
[P,A,B]=eigmakemat(wp,ws,M); %To get the 3 matrices P,A and B
C=alpha*A+beta*B;
C_t=C';
a=C_t\P;
[Hr,omega] = Hr_Type1_eigfil(a); %Hr is the designed filter

HR(:,3)=Hr;
%% M=27 is the number of coefficients
M=27;
[P,A,B]=eigmakemat(wp,ws,M); %To get the 3 matrices P,A and B
C=alpha*A+beta*B;
C_t=C';
a=C_t\P;
[Hr,omega] = Hr_Type1_eigfil(a); %Hr is the designed filter

HR(:,4)=Hr;
%% M=33 is the number of coefficients
M=33;
[P,A,B]=eigmakemat(wp,ws,M); %To get the 3 matrices P,A and B
C=alpha*A+beta*B;
C_t=C';
a=C_t\P;
[Hr,omega] = Hr_Type1_eigfil(a); %Hr is the designed filter

HR(:,5)=Hr;

%% Plotting the filters
PlotGraphs(omega,HR)

%% Conclusions
% Best eigen filter is observed at M=33.

% It can be seen that as M increases, the maximum error observed in passband
% and stopband reduces, and the length of transition band decreases. 

% But the approximation error is not uniformly distributed in both the passband
% and the stopband in eigenfilters .