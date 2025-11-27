clear; clc; close all;

funcs = {@f1, @f2, @f3};
func_names = {'f1(x)', 'f2(x)', 'f3(x)'};

a1 = -1;
b1 = 3;

% l_values = 0.001 : 0.001 : 0.1;
l_values = 0.003 : 0.0001 : 0.1;


fun_calls = zeros(length(funcs), length(l_values));

for i = 1:length(funcs)
    for j = 1:length(l_values)
        l = l_values(j);

        [~, ~, ~, ~, ~, calc, ~, ~] = golden_section_search(funcs{i}, a1, b1, l);

        fun_calls(i,j) = calc;
    end
end

figure;
for i = 1:3
    subplot(3,1,i)
    plot(l_values, fun_calls(i,:), 'LineWidth', 1.5)
    xlabel('l')
    ylabel('Function evaluations')
    title(['Golden Section Search on ' func_names{i}])
    grid on
end
