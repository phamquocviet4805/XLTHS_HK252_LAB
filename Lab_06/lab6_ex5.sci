clear; 
clc; 
clf();

w = -%pi:0.01:%pi;

Y = (1 + exp(-%i * w)) ./ (1 - 0.5 * exp(-%i * w));

mag_Y = abs(Y);
phase_Y = atan(imag(Y), real(Y));

figure(1);

subplot(2,1,1);
plot(w, mag_Y, 'b', "thickness", 2);
title('Amplitude Spectrum', 'fontsize', 3);
xlabel('Frequency ω (rad/sample)', 'fontsize', 2);
ylabel('|Y(ω)|', 'fontsize', 2);
xgrid(1); 

subplot(2,1,2);
plot(w, phase_Y, 'r', "thickness", 2);
title('Phase Spectrum', 'fontsize', 3);
xlabel('Frequency ω (rad/sample)', 'fontsize', 2);
ylabel('Phase θ(ω) (radians)', 'fontsize', 2);
xgrid(1);
