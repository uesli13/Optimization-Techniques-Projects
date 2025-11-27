clear; clc; close all; format long;

x_range = -2.5 : 0.2 : 2.5;
y_range = -2.5 : 0.2 : 2.5;
[X, Y] = meshgrid(x_range, y_range);

G = grad_f(X, Y);

width = size(X, 2); 
U = G(:, 1:width);
V = G(:, width+1:end);

figure;
hold on;

Z = f(X, Y);
contour(X, Y, Z, 20, 'LineWidth', 1.5); 
colorbar;

quiver(X, Y, U, V, 'Color', 'k', 'LineWidth', 1.2);

hold off;

title('Gradient Vector Field of f(x,y)');
xlabel('x');
ylabel('y');
axis equal;
grid on;