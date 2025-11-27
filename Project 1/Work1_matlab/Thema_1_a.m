clear; clc; close all;

funcs = {@f1, @f2, @f3};
func_names = {'f1(x)', 'f2(x)', 'f3(x)'};

l = 0.01;
a1 = -1; 
b1 = 3;

e_values = 0.0001 : 0.0001 : 0.0049;

fun_calls = zeros(length(funcs), length(e_values));

for i = 1:length(funcs)
    for j = 1:length(e_values)
        e = e_values(j);

        [~, ~, ~, ~, ~, calls, ~, ~] = dichotomous_search(funcs{i}, a1, b1, l, e);

        fun_calls(i,j) = calls;
    end
end

figure;
for i = 1:3
    subplot(3,1,i)
    plot(e_values, fun_calls(i,:), 'LineWidth', 1.5)
    xlabel('\epsilon')
    ylabel('Function evaluations')
    title(['Dichotomous Search on ' func_names{i}])
    grid on
end
