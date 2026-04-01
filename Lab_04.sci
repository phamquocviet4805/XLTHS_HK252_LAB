clear;
clf;
clc;

// Ex 05
//Tải thư viên IPCV về máy tại đường link: https://atoms.scilab.org/toolboxes/IPCv
//Install thư viện vào Scilab bằng lệnh: atomsInstall("đường dẫn tới file.zip")
//Đọc một ảnh màu bất kỳ và chuyển sang ảnh xám (Grayscale - là 1 ma trận 2D) để đảm bảo sự đơn giản khi vẽ histogram
img_rgb = imread("C:\Users\GIGABYTE\OneDrive\Pictures\Saved Pictures\hcmut.png"); 
img_gray = rgb2gray(img_rgb); 

figure(1);
subplot(1,2,1);
imshow(img_gray);
title("Ảnh gốc (Grayscale)");

subplot(1,2,2);
// Thay vì dùng imhist(img_gray) trực tiếp, ta lấy dữ liệu ra và tự vẽ 
// để lỗi hiển thị đồ họa  khi kết hợp hàm imhist() của thư viện IPCv với hàm chia khung hình subplot()
[counts1, bins1] = imhist(img_gray); 
bar(bins1, counts1); // Vẽ biểu đồ cột ổn định hơn
title("Biểu đồ Histogram của ảnh gốc");

// Tăng độ tương phản cho bức ảnh
img_eq = imhistequal(img_gray);

figure(2);
subplot(1,2,1);
imshow(img_eq);
title("Ảnh sau khi cân bằng Histogram");

subplot(1,2,2);
// Tương tự, lấy dữ liệu và tự vẽ cho ảnh đã cân bằng
[counts2, bins2] = imhist(img_eq);
bar(bins2, counts2);
title("Histogram sau khi cân bằng");


// Tạo một bộ lọc Gaussian kích thước 5x5, độ lệch chuẩn sigma = 2
h_gaussian = fspecial('gaussian', 5, 2); 
// Áp dụng làm mờ
img_blur = imfilter(img_rgb, h_gaussian);

figure(3);
imshow(img_blur);
title("Ảnh sau khi làm mờ (Gaussian Blur)");

// Ex 06 - 1
x = [1 , 2 , -3 , 2 , 1];
h = [1 , 0 , -1];
y = conv (h, x) ;
n = -3:3;

plot2d3(n, y, style = 2) ;
xtitle ("Convalution y(n)", "n", "y(n)") ;
xgrid () ;
gca().children.children.thickness = 3;

// Ex 06 - 2
x = [1 2 -3 2 1];
h = [1 0 -1];
N = length(x);
M = length(h);
L = N + M - 1;
H = zeros(L, N);

for i = 1:M
    for j = 1:N
        if i + j - 1 <= L then
            H(i + j - 1, j) = h(i);
        end
    end
end

y_matrix = H * x';
disp("Ket qua tich chap bang ma tran:");
disp(y_matrix');

// Ex 06 - 3
clf();

x = [1 2 -3 2 1];
h = [1 0 -1];
y = conv(x, h);

nx = 0:length(x)-1;
ny = 0:length(y)-1;

Ex = sum(abs(x).^2);
Ey = sum(abs(y).^2);

subplot(3,1,1);
plot(nx, x, 'bo-');
xgrid();
xtitle("Tin hieu x(n)", "n", "Gia tri");
gca().children.children.thickness = 3;

subplot(3,1,2);
plot(ny, y, 'ro-');
xgrid();
xtitle("Tin hieu y(n) = x(n) * h(n)", "n", "Gia tri");
gca().children.children.thickness = 3;

subplot(3,1,3);
plot(nx, Ex * ones(1, length(nx)), 'g-');
plot(ny, Ey * ones(1, length(ny)), 'm-');
xgrid();
legend("E_x = 19", "E_y = 42");
xtitle("Nang luong cua cac tin hieu", "n", "Nang luong");
gca().children.children.thickness = 3;

// Ex 07 - 1
clear;
clc;
x = [1 2 -3 2 1];
h = [1 0 -1 -1 1];

N = length(x);
M = length(h);
y = zeros(1, N);

for n = 1:N
    s = 0;
    for k = 1:M
        idx = pmodulo(n - k, N) + 1;
        s = s + h(k) * x(idx);
    end
    y(n) = s;
end

disp("Ket qua tich chap tron y(n):");
disp(y);

// Ex 07 - 2
x = [1 2 -3 2 1];
h = [1 0 -1];
N = length(x);
M = length(h);
L = N + M - 1;

H = zeros(L, N);

for i = 1:M
    for j = 1:N
        if i + j - 1 <= L then
            H(i + j - 1, j) = h(i);
        end
    end
end
y_matrix = H * x';
disp("Ket qua tich chap bang ma tran:");
disp(y_matrix');

// Ex 07 - 3
clc;
clear;
clf();

x = [1 2 -3 2 1];
h = [1 0 -1 -1 1];

N = length(x);
y = zeros(1, N);

for n = 1:N
    s = 0;
    for k = 1:N
        idx = pmodulo(n - k, N) + 1;
        s = s + h(k) * x(idx);
    end
    y(n) = s;
end

disp("Ket qua tich chap tron y(n):");
disp(y);

n = 0:N-1;
Ex = sum(abs(x).^2);
Ey = sum(abs(y).^2);

plot(n, x, 'bo-');
plot(n, y, 'ro-');
plot(n, Ex * ones(1, N), 'g--');
plot(n, Ey * ones(1, N), 'm--');

xgrid();
legend("x(n)", "y(n)", "E_x", "E_y");
xtitle("Bai 7: figure", "n", "Gia tri");

gca().children.children.thickness = 3;
