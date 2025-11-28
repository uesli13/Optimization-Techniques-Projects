function [x_hist, y_hist, f_val_hist, k, fun_calls, grad_calls, x_min, y_min, f_min] = steepest_descent_a(x1,y1, gamma, e, f, grad_f)

    x = [];
    y = [];
    f_val_hist = [];
    grad = [];
    d = [];

    x(1) = x1;
    y(1) = y1;
    f_val_hist(1) = f(x1, y1);
    fun_calls = 1;

    grad(1,:) = grad_f(x(1),y(1));
    grad_calls = 1;

    k = 1;
    max_iter = 10000;

    while norm(grad(k,:)) >= e && k < max_iter
    
        d(k,:) = -grad(k,:);

        x(k+1) = x(k) + gamma*d(k,1);
        y(k+1) = y(k) + gamma*d(k,2);

        f_val_hist(k+1) = f(x(k+1), y(k+1));
        % I don't count this as computational cost because it's not used
        % for the algorithm, but only for it's visualization

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