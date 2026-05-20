function y = lin_conv_fft(x, h)
    N1 = length(x);
    N2 = length(h);
    N = N1 + N2 - 1; 
    
    x_padded = [x, zeros(1, N - N1)];
    h_padded = [h, zeros(1, N - N2)];
    
    X = fft(x_padded);
    H = fft(h_padded);
    Y = X .* H;
    y = round(real(ifft(Y)));
endfunction


disp("--- Bài 7: Kiểm chứng Tích chập tuyến tính ---");
x_lin = [1, -1, 2];        
h_lin = [0, 1, 2, 3, 4];    

y_fft = lin_conv_fft(x_lin, h_lin);
y_conv = real(conv(x_lin, h_lin));

disp("Input x:");
disp(x_lin);
disp("Input h:");
disp(h_lin);
disp("Kết quả dùng hàm FFT zero-padding:");
disp(y_fft);
disp("Kết quả dùng hàm conv của Scilab:");
disp(y_conv);
