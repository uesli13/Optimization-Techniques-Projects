clear; clc; close all;

funcs = {@f1, @f2, @f3};
func_names = {'f1(x)', 'f2(x)', 'f3(x)'};

a1 = -1;
b1 = 3;
e = 0.001;
l_values = [0.01, 0.05, 0.1];

figure;

for i = 1:3
  
    subplot(3, 1, i);
    hold on;

    for j = 1:length(l_values)
        l = l_values(j);

        [~, ~, ~, ~, k, ~ ,A_hist, B_hist] = golden_section_search(funcs{i}, a1, b1, l);

        k_axis = 1:length(A_hist);

        plot(k_axis, A_hist, 'LineStyle', '-', 'Marker', 'o', 'MarkerSize', 4, 'LineWidth', 1.5, 'DisplayName', ['a_k , l=' num2str(l)]);
        plot(k_axis, B_hist, 'LineStyle', '--', 'Marker', 'x', 'MarkerSize', 4, 'LineWidth', 1.5, 'DisplayName', ['b_k , l=' num2str(l)]);

    end

    xlabel('k (Iteration)');
    ylabel('Values of a_k and b_k');
    title(['Evolution of interval bounds for ' func_names{i}]);
    grid on;
    legend show;
    hold off;
end
