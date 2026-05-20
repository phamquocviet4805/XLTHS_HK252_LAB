clear; 
clc;
clf();
 
w = -%pi:0.01:%pi;
 
X2 = 1 + exp(-%i * w) + exp(-%i * 2 * w) + exp(-%i * 3 * w);

mag_X2 = abs(X2);
phase_X2 = atan(imag(X2), real(X2));

figure(2);
subplot(2,1,1);
plot(w, mag_X2, 'b', "thickness", 2);
title('Amplitude Spectrum', 'fontsize', 3);
xlabel('Frequency ω (rad/sample)', 'fontsize', 2);
ylabel('|X2(ω)|', 'fontsize', 2);
xgrid;

subplot(2,1,2);
plot(w, phase_X2, 'r', "thickness", 2);
title('Phase Spectrum', 'fontsize', 3);
xlabel('Frequency ω (rad/sample)', 'fontsize', 2);
ylabel('Phase θ(ω) (radians)', 'fontsize', 2);
xgrid;
