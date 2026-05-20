N = 8;      
n = 0:(N-1); 

x_n = 2 + 2*cos(%pi*n/4) + cos(%pi*n/2) + (1/2)*cos(3*%pi*n/4);

// fft trong Scilab tính tổng, nên ta chia cho N để ra ck
ck = fft(x_n) / N;

P_k = abs(ck).^2;

omega = (-N/2 : N/2 - 1) * (2*%pi / N);
P_k_shifted = fftshift(P_k);


clf(); 

plot2d3(omega, P_k_shifted, style=2);
e = gce(); 
e.children.thickness = 3;          
title("Phổ mật độ công suất của x(n)", "fontsize", 3);
xlabel("Tần số góc ω (rad/sample)", "fontsize", 2);
ylabel("P(ω)", "fontsize", 2);

ax = gca();
ax.x_ticks = tlist(["ticks", "locations", "labels"], ...
                   [-%pi, -3*%pi/4, -%pi/2, -%pi/4, 0, %pi/4, %pi/2, 3*%pi/4, %pi], ...
                   ["-\pi", "-3\pi/4", "-\pi/2", "-\pi/4", "0", "\pi/4", "\pi/2", "3\pi/4", "\pi"]);
ax.data_bounds = [-%pi-0.5, 0; %pi+0.5, 4.5];
xgrid(3);
