clear; 
clc; 
clf();

A = 1;
a = 2;
F = -10:0.01:10;
W = 2* %pi*F;

Xb = (2*A*a) ./ (a^2 + W.^2);
magB = abs(Xb);

plot(W, magB, 'b');
title("Magnitude Spectrum");
xlabel("F (Hz)"); ylabel("|X(F)|");
xgrid();
