function [x_hist, y_hist, f_val_hist, k, fun_calls, grad_calls, x_min, y_min, f_min] = steepest_descent_c(x1,y1, e, f, grad_f)
    
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
    
    % Armijo rule parametres
    alpha = 1e-3;
    beta = 0.5;
    s = 1;

    while norm(grad(k,:)) >= e && k < max_iter
    
        d(k,:) = -grad(k,:);
        
        f_curr = f_val_hist(k);
        
        d_dot_grad = d(k,:) * grad(k,:)'; 

        mk = 0;
        gamma = s * (beta^mk);
        
        % Calculate candidate point
        x_next = x(k) + gamma * d(k,1);
        y_next = y(k) + gamma * d(k,2);
        
        f_next = f(x_next, y_next);
        fun_calls = fun_calls + 1;
        
        % Armijo rule
        while (f_curr - f_next) < (-alpha * gamma * d_dot_grad)
            
            mk = mk + 1;
            
            % Update gamma based on new mk
            gamma = s * (beta^mk);
            
            % Recalculate candidate point with new gamma
            x_next = x(k) + gamma * d(k,1);
            y_next = y(k) + gamma * d(k,2);
            
            f_next = f(x_next, y_next);
            fun_calls = fun_calls + 1;
            
            % Safety break to prevent infinite loops if gamma becomes too small
            if mk > 50
                break; 
            end
        end

        % Update system with the accepted mk and gamma
        x(k+1) = x_next;
        y(k+1) = y_next;

        f_val_hist(k+1) = f_next;

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