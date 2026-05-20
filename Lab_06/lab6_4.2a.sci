clear; 
clc; 
clf();

A = 1;
a = 2;
F = -10:0.01:10;
W = 2* %pi*F;

Xa = A ./ (a + %i*W);
magA = abs(Xa);
phaseA = atan(imag (Xa) , real (Xa));

subplot(2,1,1);
plot(W, magA, 'b');
title("Magnitude Spectrum");
xlabel("F (Hz)"); ylabel("|X(F)|");
xgrid();

subplot(2,1,2);
plot(W, phaseA, 'r');
title("Phase Spectrum");
xlabel("F (Hz)"); ylabel("Angle (rad)");
xgrid();

