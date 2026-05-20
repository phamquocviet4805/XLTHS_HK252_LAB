clear; 
clc; 
clf();

w = -%pi:0.01:%pi;

H = 1 ./ (1 + 0.1 * exp(-%i * w) + 0.2 * exp(-%i * 2 * w));

mag_H = abs(H);

phase_H = atan(imag(H), real(H));

figure(1);

subplot(2,1,1);
plot(w, mag_H, 'b', "thickness", 2);
title('Amplitude Spectrum of h(n)', 'fontsize', 3);
xlabel('Frequency ω (rad/sample)', 'fontsize', 2);
ylabel('|H(ω)|', 'fontsize', 2);
xgrid(1);

subplot(2,1,2);
plot(w, phase_H, 'r', "thickness", 2);
title('Phase Spectrum of h(n)', 'fontsize', 3);
xlabel('Frequency ω (rad/sample)', 'fontsize', 2);
ylabel('Phase θ(ω) (radians)', 'fontsize', 2);
xgrid(1);
