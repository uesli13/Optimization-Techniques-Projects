clear; clc; close all; format long;

e = 0.001;
gammas = [0.1 ; 0.3 ; 3; 5];

% Starting point
x1_start = 2;
x2_start = 5;

x_range = linspace(-10, 10, 100);
y_range = linspace(-10, 10, 100);
[X, Y] = meshgrid(x_range, y_range);
Z = f(X, Y);

for i=1:length(gammas)
    
    gamma = gammas(i);

    fprintf('--------------------------------------------------\n');
    fprintf('Running Optimization for Starting Point: (%g, %g) and gamma = %.1f \n', x1_start, x2_start, gamma);

    [x_hist, y_hist, f_hist, k, fun_calls, grad_calls, x_min, y_min, f_min] = steepest_descent_a(x1_start, x2_start, gamma, e, @f, @grad_f);
    
    figure(i); 
    contourf(X, Y, Z, 50);
    colorbar;
    xlabel('x');
    ylabel('y');
    title(sprintf('Steepest Descent: gamma = %.1f', gamma));    hold on;

    plot(x_hist, y_hist, 'r-o', 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', 'red');
    plot(x1_start, x2_start, 'wd', 'MarkerSize', 8, 'MarkerFaceColor', 'w');
    plot(x_min, y_min, 'y*', 'MarkerSize', 12, 'LineWidth', 2);
end
