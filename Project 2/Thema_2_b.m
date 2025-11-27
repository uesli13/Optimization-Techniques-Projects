clear; clc; close all; format long;

% Define the three starting points
start_points = [0, 0; -1, -1; 1, 1];
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
title('Steepest Descent: Comparison of Starting Points');
hold on;




% --- Figure 2: Convergence Plot (ΝΕΟ) ---
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
    
    [x_hist, y_hist, f_hist, k, x_min, y_min, f_min] = steepest_descent_b(x1, y1, e, @f, @grad_f);
    
    disp('Minimum found at (x, y):');
    disp([x_min, y_min]);
    disp('Function value f_min:');
    disp(f_min);
    disp('Total Iterations:');
    disp(k);



    
    
% --- Plot στο Figure 1 (Contour - Τροχιά) ---
    figure(1); 
    c = colors(i);
    plot(x_hist, y_hist, [c '-o'], 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', c);
    plot(x1, y1, 'wd', 'MarkerSize', 8, 'MarkerFaceColor', 'w');
    plot(x_min, y_min, 'y*', 'MarkerSize', 12, 'LineWidth', 2);
    path_names{end+1} = sprintf('Start (%g, %g)', x1, y1);


    % --- Plot στο Figure 2 (Convergence - Σύγκλιση) ---
    figure(2);
    % Plotaroume to f_hist. O aksonas x einai 0 ews k
    plot(0:k-1, f_hist, [c '-o'], 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', c);
end

% Προσθήκη λεζάντας και στα δύο διαγράμματα
figure(1); legend(path_names, 'Location', 'best'); hold off;
figure(2); legend(path_names, 'Location', 'best'); hold off;
