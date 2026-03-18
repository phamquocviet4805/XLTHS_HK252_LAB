clear;
clf;
clc;

// Ex 01
function [y_n, y_origin] = delay (x_n, x_origin, k)
    if (k <= 0) then
        error("Giá trị k không hợp lệ")
    end
    y_n = x_n;
    y_origin = x_origin - k;
    n_x = (1:length(x_n)) - x_origin;
    n_y = (1:length(y_n)) - y_origin;
    
    subplot(2, 1, 1);
    plot2d3(n_x, x_n, style = 5);
    xtitle("Tín hiệu gốc x(n)", "n", "x(n)");
    xgrid();
    a = gca();
    a.data_bounds = [min(n_x)-2, min(x_n)-2; max(n_x)+2, max(x_n)+2];
    a.children.children.thickness = 3;
    
    subplot(2, 1, 2);
    plot2d3(n_y, y_n, style = 2);
    xtitle("Tín hiệu Delay y(n)", "n", "y(n)");
    xgrid();
    b = gca();
    b.data_bounds = [min(n_x)-2, min(x_n)-2; max(n_x)+2, max(x_n)+2];
    b.children.children.thickness = 3;
    
    disp ("Ma trận y(n):", y_n);
    disp ("Giá trị gốc y_origin:", y_origin);
    
endfunction

// Ex 02
function [y_n, y_origin] = advance (x_n, x_origin, k)
    if (k <= 0) then
        error("Giá trị k không hợp lệ")
    end
    y_n = x_n;
    y_origin = x_origin + k;
    n_x = (1:length(x_n)) - x_origin;
    n_y = (1:length(y_n)) - y_origin;
    
    subplot(2, 1, 1);
    plot2d3(n_x, x_n, style = 5);
    xtitle("Tín hiệu gốc x(n)", "n", "x(n)");
    xgrid();
    a = gca();
    a.data_bounds = [min(n_x)-2, min(x_n)-2; max(n_x)+2, max(x_n)+2];
    a.children.children.thickness = 3;
    
    subplot(2, 1, 2);
    plot2d3(n_y, y_n, style = 2);
    xtitle("Tín hiệu Delay y(n)", "n", "y(n)");
    xgrid();
    b = gca();
    b.data_bounds = [min(n_x)-2, min(x_n)-2; max(n_x)+2, max(x_n)+2];
    b.children.children.thickness = 3;
    
    disp ("Ma trận y(n):", y_n);
    disp ("Giá trị gốc y_origin:", y_origin);
    
endfunction

// Ex 03
function [y_n, y_origin] = fold (x_n, x_origin)
    y_n = flipdim(x_n, 2);
    y_origin = length(x_n) - x_origin + 1;
    n_x = (1:length(x_n)) - x_origin;
    n_y = flipdim(-n_x, 2);
    
    subplot(2, 1, 1);
    plot2d3(n_x, x_n, style = 5);
    xtitle("Tín hiệu gốc x(n)", "n", "x(n)");
    xgrid();
    a = gca();
    a.data_bounds = [min(n_x)-2, min(x_n)-2; max(n_x)+2, max(x_n)+2];
    a.children.children.thickness = 3;
    
    subplot(2, 1, 2);
    plot2d3(n_y, y_n, style = 2);
    xtitle("Tín hiệu Delay y(n)", "n", "y(n)");
    xgrid();
    b = gca();
    b.data_bounds = [min(n_x)-2, min(x_n)-2; max(n_x)+2, max(x_n)+2];
    b.children.children.thickness = 3;
    
    disp ("Ma trận y(n):", y_n);
    disp ("Giá trị gốc y_origin:", y_origin);
    
endfunction

// Ex 04
function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    L1 = length(x1n);
    L2 = length(x2n);
   
    // Start - end index of signal
    n1_start = -(x1origin - 1);
    n1_end   = L1 - x1origin;
    n2_start = -(x2origin - 1);
    n2_end   = L2 - x2origin;
    n_start = min(n1_start, n2_start);
    n_end   = max(n1_end, n2_end);
    
    // Create vector 
    n = n_start:n_end;
    yorigin = max(x1origin, x2origin);
    x1 = zeros(1, length(n));
    x2 = zeros(1, length(n));
    
    // Push value of xn to x
    idx1_start = n1_start - n_start + 1;
    idx1_end   = idx1_start + L1 - 1;
    x1(idx1_start:idx1_end) = x1n;

    idx2_start = n2_start - n_start + 1;
    idx2_end   = idx2_start + L2 - 1;
    x2(idx2_start:idx2_end) = x2n;

    yn = x1 + x2;

    // Figure    
    clf;
    subplot(3,1,1);
    plot2d3(n, x1, style = 2);
    title("Signal x_1(n)");
    xlabel("n");
    ylabel("Amplitude");
    gca().children.children.thickness = 3;
    xgrid();
    
    subplot(3,1,2);
    plot2d3(n, x2, style = 5);
    title("Signal x_2(n)");
    xlabel("n");
    ylabel("Amplitude");
    gca().children.children.thickness = 3;
    xgrid();

    subplot(3,1,3);
    plot2d3(n, yn, style = 4);
    title("Signal y(n) = x_1(n) + x_2(n)");
    xlabel("n");
    ylabel("Amplitude");
    gca().children.children.thickness = 3;
    xgrid();
    
endfunction

// Ex 05
function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    L1 = length(x1n);
    L2 = length(x2n);
   
    // Start - end index of signal
    n1_start = -(x1origin - 1);
    n1_end   = L1 - x1origin;
    n2_start = -(x2origin - 1);
    n2_end   = L2 - x2origin;
    n_start = min(n1_start, n2_start);
    n_end   = max(n1_end, n2_end);
    
    // Create empty vector with length n
    n = n_start:n_end;
    yorigin = max(x1origin, x2origin);
    x1 = zeros(1, length(n));
    x2 = zeros(1, length(n));
    
    // Push value of xn to x
    idx1_start = n1_start - n_start + 1;
    idx1_end   = idx1_start + L1 - 1;
    x1(idx1_start:idx1_end) = x1n;

    idx2_start = n2_start - n_start + 1;
    idx2_end   = idx2_start + L2 - 1;
    x2(idx2_start:idx2_end) = x2n;

    yn = x1 .* x2;

    // Figure    
    clf;
    subplot(3,1,1);
    plot2d3(n, x1, style = 2);
    title("Signal x_1(n)");
    xlabel("n");
    ylabel("Amplitude");
    gca().children.children.thickness = 3;
    xgrid();
    
    subplot(3,1,2);
    plot2d3(n, x2, style = 5);
    title("Signal x_2(n)");
    xlabel("n");
    ylabel("Amplitude");
    gca().children.children.thickness = 3;
    xgrid();

    subplot(3,1,3);
    plot2d3(n, yn, style = 4);
    title("Signal y(n) = x_1(n) . x_2(n)");
    xlabel("n");
    ylabel("Amplitude");
    gca().children.children.thickness = 3;
    xgrid();
    
endfunction

// Ex 06
function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    // Tinh tich chap
    yn = conv(xn, hn);

    // Vi tri goc cua tin hieu dau ra
    yorigin = xorigin + horigin - 1;

    // Xac dinh truc chi so cho tung tin hieu
    nx = -(xorigin - 1) : (length(xn) - xorigin);
    nh = -(horigin - 1) : (length(hn) - horigin);
    ny = -(yorigin - 1) : (length(yn) - yorigin);

    // Ve do thi
    clf;

    subplot(3,1,1);
    plot2d3(nx, xn, style = 1);
    title("Input signal x(n)");
    xlabel("n");
    ylabel("Amplitude");
    gca().children.children.thickness = 3;

    subplot(3,1,2);
    plot2d3(nh, hn, style = 2);
    title("System characteristic h(n)");
    xlabel("n");
    ylabel("Amplitude");
    gca().children.children.thickness = 3;

    subplot(3,1,3);
    plot2d3(ny, yn, style = 3);
    title("Output signal y(n) = x(n) * h(n)");
    xlabel("n");
    ylabel("Amplitude");
    gca().children.children.thickness = 3;
endfunction




