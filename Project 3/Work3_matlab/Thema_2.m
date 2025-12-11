clear; clc; close all; format long;

e = 0.01;
gamma = 0.5;
s = 5;
x_start  = [5,-5];

x1_range = linspace(-12, 12, 100);
x2_range = linspace(-12, 12, 100);
[X1, X2] = meshgrid(x1_range, x2_range);
Z = f(X1, X2);

figure(1); 
contourf(X1, X2, Z, 50);
colorbar;
xlabel('x_1');
ylabel('x_2');
title(sprintf('Steepest Descent with projection : gamma = %.1f, s = %.1f', gamma, s));
hold on;

figure(2);
hold on;
title(sprintf('Steepest Descent with projection: gamma = %.1f s = %.1f\nConvergence of Function Value vs Iterations', gamma, s));
xlabel('Iterations (k)');
ylabel('Objective Function Value f(x_1_k, x_2_k)');
grid on;

[x_hist, f_val_hist, k, fun_calls, grad_calls, x_min, f_min] = steepest_descent_proj(s, gamma, x_start, e, @f, @grad_f);

disp('Minimum found at (x_1, x_2):');
disp(x_min);
disp('Function value f_min:');
disp(f_min);
disp('Total Iterations:');
disp(k);
disp('Total Function calls:');
disp(fun_calls);
disp('Total Gradient calls:');
disp(grad_calls);

figure(1);
plot(x_hist(:,1), x_hist(:,2), 'r-o', 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', 'red');
plot(x_start(1), x_start(2), 'wd', 'MarkerSize', 8, 'MarkerFaceColor', 'w');
plot(x_min(1), x_min(2), 'y*', 'MarkerSize', 12, 'LineWidth', 2);

fprintf("size(f_val_hist):(%g %g)\n", size(f_val_hist(:)));
figure(2);
plot(1:length(f_val_hist), f_val_hist, 'r-o', 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', 'r');
% x_hist