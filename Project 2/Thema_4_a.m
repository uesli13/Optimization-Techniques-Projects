clear; clc; close all; format long;

% Define the three starting points
start_points = [0, 0; -1, -1; 1, 1];
colors = ['r', 'b', 'm']; % Red, Blue, Magenta lines for the 3 paths
path_names = {}; % To store legend entries

e = 0.001;
gamma = 0.3;

% Setup the figure and contour plot first
x_range = linspace(-2.5, 2.5, 100);
y_range = linspace(-2.5, 2.5, 100);
[X, Y] = meshgrid(x_range, y_range);
Z = f(X, Y);

figure;
contourf(X, Y, Z, 50);
colorbar;
xlabel('x');
ylabel('y');
title('Levenberg-Marquardt Method: Comparison of Starting Points');
hold on;

% Loop through each starting point
for i = 1:size(start_points, 1)
    x1 = start_points(i, 1);
    y1 = start_points(i, 2);
    
    fprintf('--------------------------------------------------\n');
    fprintf('Running Optimization for Starting Point: (%g, %g)\n', x1, y1);
    
    [x_hist, y_hist, f_hist, k, x_min, y_min, f_min] = levenberg_marquardt_a(x1, y1, gamma, e, @f, @grad_f, @hessian_f);
    
    disp('Minimum found at (x, y):');
    disp([x_min, y_min]);
    disp('Function value f_min:');
    disp(f_min);
    disp('Total Iterations:');
    disp(k);
    
    % Plot the path with a specific color
    c = colors(i);
    % We save the handle 'p' to create a clean legend later
    p = plot(x_hist, y_hist, [c '-o'], 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', c);
    
    % Mark Start (White Diamond)
    plot(x1, y1, 'wd', 'MarkerSize', 8, 'MarkerFaceColor', 'w');
    
    % Mark End (Yellow Star)
    plot(x_min, y_min, 'y*', 'MarkerSize', 12, 'LineWidth', 2);
    
    % Store name for legend
    path_names{end+1} = sprintf('Start (%g, %g)', x1, y1);
end

% Create a custom legend just for the colored paths (ignoring the start/end markers to keep it clean)
% We need to find the line objects we just plotted. 
% A simple way is to just add the legend generally, but this targets the colored lines:
legend(path_names, 'Location', 'best');

hold off;