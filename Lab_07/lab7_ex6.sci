function y = circ_conv_fft(x, h)
    // x, h phải có cùng độ dài N
    X = fft(x);
    H = fft(h);
    Y = X .* H;
    y = ifft(Y);
endfunction

function y = circ_conv_direct(x, h)
    N = length(x);
    y = zeros(1, N);
    for n = 0:(N-1)
        for k = 0:(N-1)
            idx = pmodulo(n - k, N); 
            y(n+1) = y(n+1) + x(k+1) * h(idx+1);
        end
    end
endfunction


disp("--- Bài 6: Kiểm chứng Tích chập vòng ---");
x_test = [1, 2, 3, 4];
h_test = [0, 1, 0.5, 2];

y1 = circ_conv_fft(x_test, h_test);
y2 = circ_conv_direct(x_test, h_test);

disp("Input x:");
disp(x_test);
disp("Input h:");
disp(h_test);
disp("Kết quả dùng FFT:");
disp(y1);
disp("Kết quả tính trực tiếp:");
disp(y2);

