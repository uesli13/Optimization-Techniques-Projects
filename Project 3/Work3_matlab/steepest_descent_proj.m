function [x_hist, f_val_hist, k, fun_calls, grad_calls, x_min, f_min] = steepest_descent_proj(s, gamma, x_start, e, f, grad_f)
    
    max_iter = 10000;
    x = zeros(max_iter, length(x_start));
    f_val_hist = zeros(max_iter,1);
    
    % Initial values
    x(1,:) = x_start;
    f_val_hist(1) = f(x(1,1), x(1,2));
    fun_calls = 1;      %Computational cost of calculating f
    
    grad_calls  = 0;
    k = 1;
    
    keeplooping = true; 

    while keeplooping && k < max_iter
        
        grad = grad_f(x(k,1), x(k,2));
        grad_calls = grad_calls + 1;

        x_bar = proj_x(x(k,:) - s*grad);

        x(k+1,:) = x(k,:) + gamma*(x_bar - x(k,:));

        f_val_hist(k+1) = f( x(k+1,1), x(k+1,2) );
        fun_calls = fun_calls + 1;

        if norm( x(k+1,:) - x(k,:) ) < e
            keeplooping = false;
        else
            k = k+1;
        end
    end
    
    if k >= max_iter
        disp('Warning: Maximum iterations reached without convergence.');
        last_arg = k;
    else
        last_arg = k+1;
    end

    x_hist = x(1:last_arg,:);
    f_val_hist = f_val_hist(1:last_arg);

    x_min = x(last_arg,:);
    f_min = f_val_hist(last_arg);
end