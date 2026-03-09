clc;
close;
clear;
clf;

//  Ex 1.1
//      Qs - 1
x = [1:4];
xp1 = x + 1;
disp("x + 1 = ", xp1)

//      Qs - 2
y = [5:8];
xy = x .* y;
disp("x * y = ", xy)

//      Qs - 3
x = linspace(0, %pi, 10);
sinx = sin(x);
disp("vector sin x: ", sinx)

//  Ex 1.2
//      Qs - 1

t = linspace(0, 0.1, 1000);
x_a = 3*sin(100*%pi*t);
subplot(1, 2, 1)
plot(t, x_a, "r")

//      Qs - 3
n = linspace(0, 30, 30);
x_n = 3*sin(%pi*n/3);
subplot(1, 2, 2)
plot2d3(n, x_n, style = 1)

//      Qs - 4
delta = 0.1;
x_q = floor(x_n/delta)*delta;
subplot(1, 2, 2)
plot2d3(n, x_q, style = 4)



