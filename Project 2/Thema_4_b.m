clear; clc; close all; format long;

% Define the three starting points
start_points = [0, 0; 1, 1; -1, -1];
colors = ['r', 'b', 'm']; % Red, Blue, Magenta lines for the 3 paths
path_names = {}; % To store legend entries

e = 0.001;


% Setup the figure and contour plot first
x_range = linspace(-2.5, 2.5, 100);
y_range = linspace(-2.5, 2.5, 100);
[X, Y] = meshgrid(x_range, y_range);
Z = f(X, Y);

figure(1);
contourf(X, Y, Z, 50);
colorbar;
xlabel('x');
ylabel('y');
title('Levenberg-Marquardt Method: Comparison of Starting Points');
hold on;

figure(2);
hold on;
title('Convergence of Function Value vs Iterations');
xlabel('Iterations (k)');
ylabel('Objective Function Value f(x_k, y_k)');
grid on;

% Loop through each starting point
for i = 1:size(start_points, 1)
    x1 = start_points(i, 1);
    y1 = start_points(i, 2);
    
    fprintf('--------------------------------------------------\n');
    fprintf('Running Optimization for Starting Point: (%g, %g)\n', x1, y1);
    
    [x_hist, y_hist, f_hist, k, fun_calls, grad_calls, hess_calls, x_min, y_min, f_min] = levenberg_marquardt_b(x1, y1, e, @f, @grad_f, @hessian_f);
    
    disp('Minimum found at (x, y):');
    disp([x_min, y_min]);
    disp('Function value f_min:');
    disp(f_min);
    disp('Total Iterations:');
    disp(k);
    disp('Total Function calls:');
    disp(fun_calls);
    disp('Total Gradient calls:');
    disp(grad_calls);
    disp('Total Hessian calls:');
    disp(hess_calls);
    
    figure(1); 
    c = colors(i);
    p(i) = plot(x_hist, y_hist, [c '-o'], 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', c);
    plot(x1, y1, 'wd', 'MarkerSize', 8, 'MarkerFaceColor', 'w');
    plot(x_min, y_min, 'y*', 'MarkerSize', 12, 'LineWidth', 2);
    path_names{end+1} = sprintf('Start (%g, %g)', x1, y1);

    figure(2);
    p2(i) = plot(1:k, f_hist, [c '-o'], 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', c);
end

figure(1); legend(p, path_names, 'Location', 'best'); hold off;
figure(2); legend(p2, path_names, 'Location', 'best'); hold off;
hold off;