clear;
clf;

// Ex 04
n = -5:5;
ur = n .* bool2s(n >= 0);
plot2d3(n, ur, style = 4);

// Ex 05
clf;
n = -1:1;
x = [1 3 -2];

// Dao tin hieu de tao x(-n)
x_inv = x($:-1:1);

// Thanh phan chan va le
xe = (x + x_inv)/2;
xo = (x - x_inv)/2;

// x(n)
subplot(3,1,1);
plot2d3(n, x, style = 1);
title("Discrete-time signal x(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid () ;

// xe(n)
subplot(3,1,2);
plot2d3(n, xe, style = 2);
title("Even component x_e(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid () ;

// xo(n)
subplot(3,1,3);
plot2d3(n, xo, style = 3);
title("Odd component x_o(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid () ;

// Ex 06
clf;
n = -1:3;
x1 = [0 0 1 3 -2];
x2 = [0 1 2 3 0];
y = x1 + x2;

// x1(n)
subplot(3,1,1);
plot2d3(n, x1, style = 1);
title("Signal x_1(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid () ;

// x2(n)
subplot(3,1,2);
plot2d3(n, x2, style = 2);
title("Signal x_2(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid () ;

// y(n)
subplot(3,1,3);
plot2d3(n, y, style = 3);
title("Signal y(n) = x_1(n) + x_2(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid () ;

// Ex 07
clf;
n = -1:3;
x1 = [0 0 1 3 -2];
x2 = [0 1 2 3 0];
y = x1 .* x2;

// x1(n)
subplot(3,1,1);
plot2d3(n, x1, style = 1);
title("Signal x_1(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid () ;

// x2(n)
subplot(3,1,2);
plot2d3(n, x2, style = 2);
title("Signal x_2(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid () ;

// y(n)
subplot(3,1,3);
plot2d3(n, y, style = 3);
title("Signal y(n) = x_1(n) + x_2(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid () ;

// Ex 08
// A)
clf;
n = -2:1;
x = [1 -2 3 6];

n1 = -1:2;
y1 = x($:-1:1);

subplot(2,1,1);
plot2d3(n, x, style = 2);
title("Original signal x(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid();

subplot(2,1,2);
plot2d3(n1, y1, style = 4);
title("Manipulated signal y_1(n) = x(-n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid();

// B)
clf;
n = -2:1;
x = [1 -2 3 6];

n2 = -5:0;
y2 = [1 -2 3 6 0 0];

subplot(2,1,1);
plot2d3(n, x, style = 2);
title("Original signal x(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid();

subplot(2,1,2);
plot2d3(n2, y2, style = 3);
title("Manipulated signal y_2(n) = x(n + 3)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid();

// C)
clf;
n = -2:1;
x = [1 -2 3 6];

n3 = -3:0;
y3 = x($:-1:1);
y3 = y3 .* 2

subplot(2,1,1);
plot2d3(n, x, style = 2);
title("Original signal x(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid();

subplot(2,1,2);
plot2d3(n3, y3, style = 3);
title("Manipulated signal y_3(n) = 2x(-n - 2)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness = 3;
xgrid();


