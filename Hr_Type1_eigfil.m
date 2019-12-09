function [Hr,w] = Hr_Type1_eigfil(h)
% Computes Amplitude response Hr(w) of a Type-1 LP FIR Eigenfilter
% -----------------------------------------------------------
% Hr = Amplitude Response
% w = 500 frequencies between [0 pi] over which Hr is computed
% h = Type-1 LP filter impulse response

L = length(h);
n = [0:1:L-1];
w = [0:1:500]'*pi/500; 
Hr = cos(w*n)*h;
