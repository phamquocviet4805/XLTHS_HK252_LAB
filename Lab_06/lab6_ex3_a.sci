clear;
clc;
clf();

// -pi to pi step 0.01
w = -%pi:0.01:%pi;

X1 = 1 ./ (1 - 0.1 * exp(-%i * w));

mag_X1 = abs(X1);
phase_X1 = atan(imag(X1), real(X1));

figure(1);
subplot(2,1,1);
plot(w, mag_X1, 'b', "thickness", 2);
title('Amplitude Spectrum', 'fontsize', 3);
xlabel('Frequency ω (rad/sample)', 'fontsize', 2);
ylabel('|X1(ω)|', 'fontsize', 2);
xgrid;

subplot(2,1,2);
plot(w, phase_X1, 'r', "thickness", 2);
title('Phase Spectrum', 'fontsize', 3);
xlabel('Frequency ω (rad/sample)', 'fontsize', 2);
ylabel('Phase θ(ω) (radians)', 'fontsize', 2);
xgrid;
