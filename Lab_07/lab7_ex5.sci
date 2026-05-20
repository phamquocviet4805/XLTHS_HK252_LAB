
N = 20;
n = 0:N-1;
x = sin(2 * %pi * 2 * n / N);

// Thiết lập và vẽ đồ thị
clf(); 
plot2d3(n, x); 
plot(n, x, 'ro'); // Thêm các điểm tròn đỏ tại đỉnh các mẫu


xtitle("Signal x(n) = sin(4*pi*n/20)", "n", "x(n)");
xgrid(1);
