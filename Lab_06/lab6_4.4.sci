N = 6; 
x_period = [3, 2, 1, 0, 1, 2]; 
n = -6:6;
x_n = x_period(pmodulo(n, N) + 1);

//Tính hệ số Chuỗi Fourier Rời Rạc (DFS)
ck = fft(x_period) / N; 
mag_ck = abs(ck); 
k = 0:(N-1);

clf(); 

subplot(2,1,1);
plot2d3(n, x_n, style=2);  
e1 = gce();                 
e1.children.thickness = 3;  

title("Tín hiệu rời rạc tuần hoàn x(n)", "fontsize", 3);
xlabel("Chỉ số thời gian (n)", "fontsize", 2);
ylabel("Biên độ x(n)", "fontsize", 2);
gca().data_bounds = [-6.5, 0; 6.5, 3.5]; 
xgrid(3);

subplot(2,1,2);
plot2d3(k, mag_ck, style=2); 
e2 = gce();                
e2.children.thickness = 3; 

title("Phổ biên độ |c_k|", "fontsize", 3);
xlabel("Chỉ số tần số (k)", "fontsize", 2);
ylabel("|c_k|", "fontsize", 2);
gca().data_bounds = [-0.5, 0; 5.5, 2]; 
xgrid(3);
