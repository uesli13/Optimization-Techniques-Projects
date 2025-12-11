clear; clc; close all; format long;

e = 0.001;
gammas = [0.1 ; 0.3 ; 3; 5];

% Starting point
x1_start = -8;
x2_start = 5;

x1_range = linspace(-10, 10, 100);
x2_range = linspace(-10, 10, 100);
[X1, X2] = meshgrid(x1_range, x2_range);
Z = f(X1, X2);

for i=1:length(gammas)
    
    gamma = gammas(i);

    fprintf('--------------------------------------------------\n');
    fprintf('Running Optimization for Starting Point: (%g, %g) and gamma = %.1f \n', x1_start, x2_start, gamma);

    [x1_hist, x2_hist, f_hist, k, fun_calls, grad_calls, x1_min, x2_min, f_min] = steepest_descent_a(x1_start, x2_start, gamma, e, @f, @grad_f);

    disp('Minimum found at (x_1, x_2):');
    disp([x1_min, x2_min]);
    disp('Function value f_min:');
    disp(f_min);
    disp('Total Iterations:');
    disp(k);
    disp('Total Function calls:');
    disp(fun_calls);
    disp('Total Gradient calls:');
    disp(grad_calls);

    figure(i); 
    contourf(X1, X2, Z, 50);
    colorbar;
    xlabel('x_1');
    ylabel('x_2');
    title(sprintf('Steepest Descent: gamma = %.1f', gamma));
    hold on;

    plot(x1_hist, x2_hist, 'r-o', 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', 'red');
    plot(x1_start, x2_start, 'wd', 'MarkerSize', 8, 'MarkerFaceColor', 'w');
    plot(x1_min, x2_min, 'y*', 'MarkerSize', 12, 'LineWidth', 2);

    figure(i+length(gammas));
    hold on;
    title(sprintf('Steepest Descent: gamma = %.1f\nConvergence of Function Value vs Iterations', gamma));

    xlabel('Iterations (k)');
    ylabel('Objective Function Value f(x_1_k, x_2_k)');
    grid on;

    plot(1:length(f_hist), f_hist, 'r-o', 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', 'r');
end
