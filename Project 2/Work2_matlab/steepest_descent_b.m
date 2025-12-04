function [x_hist, y_hist, f_val_hist, k, fun_calls, grad_calls, x_min, y_min, f_min] = steepest_descent_b(x1,y1, e, f, grad_f)
    
    % Matrices to keep track of the values for every iteration
    x = [];
    y = [];
    f_val_hist = [];
    grad = [];
    d = [];

    % Initial values
    x(1) = x1;
    y(1) = y1;
    f_val_hist(1) = f(x1, y1);
    fun_calls = 1;      %Computational cost of calculating f

    grad(1,:) = grad_f(x(1),y(1));
    grad_calls = 1;     %Computational cost of calculating the gradient of f

    k = 1;
    max_iter = 10000;
    
    % Parametres for golden section search
    a1=0;
    b1=6;
    l=0.001;

    while norm(grad(k,:)) >= e && k < max_iter
    
        d(k,:) = -grad(k,:);

        fun = @(gamma) f( x(k) + gamma*d(k,1) ,y(k) + gamma*d(k,2) );

        [~, ~, f_gamma, gamma, ~, gold_calls, ~, ~] = golden_section_search(fun, a1, b1, l);

        fun_calls = fun_calls + gold_calls;

        x(k+1) = x(k) + gamma*d(k,1);
        y(k+1) = y(k) + gamma*d(k,2);

        f_val_hist(k+1) = f_gamma;

        k = k+1;
        grad(k,:) = grad_f(x(k), y(k));

        grad_calls = grad_calls + 1;
    end

    if k == max_iter
        disp('Warning: Maximum iterations reached without convergence.');
    end

    x_hist = x;
    y_hist = y;
    x_min = x(k);
    y_min = y(k);
    f_min = f(x_min, y_min);

end