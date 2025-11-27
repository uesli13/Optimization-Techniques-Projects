function [x_hist, y_hist, f_val_hist, k, x_min, y_min, f_min] = steepest_descent_c(x1,y1, e, f, grad_f)

    x = [];
    y = [];
    f_val_hist = [];
    grad = [];
    d = [];

    x(1) = x1;
    y(1) = y1;
    f_val_hist(1) = f(x1, y1);
    grad(1,:) = grad_f(x(1),y(1));
    
    k = 1;

    max_iter = 10000;

    alpha = 1e-3;
    beta = 0.5;
    s = 1;

    while norm(grad(k,:)) >= e && k < max_iter
    
        d(k,:) = -grad(k,:);
        

        % Current function value
        f_curr = f(x(k), y(k));
        
        % Dot product: d^T * gradient
        % Since our vectors are row vectors, we do d * grad'
        
        d_dot_grad = d(k,:) * grad(k,:)'; 

        % --- Find smallest non-negative integer mk ---
        mk = 0;
        gamma = s * (beta^mk);
        
        % Calculate candidate point
%         x_next = x(k) + gamma * d(1);
%         y_next = y(k) + gamma * d(2);
        x_next = x(k) + gamma * d(k,1);
        y_next = y(k) + gamma * d(k,2);
        
        f_next = f(x_next, y_next);
        
        % Check the Book's Condition:
        % f(xk) - f(xk+1) >= -alpha * gamma * (d^T * gradient)
        % We loop while the condition is NOT satisfied ( < instead of >= )
        
        while (f_curr - f_next) < (-alpha * gamma * d_dot_grad)
            
            mk = mk + 1;
            
            % Update gamma based on new mk
            gamma = s * (beta^mk);
            
            % Recalculate candidate point with new gamma
            x_next = x(k) + gamma * d(k,1);
            y_next = y(k) + gamma * d(k,2);
            f_next = f(x_next, y_next);
            
            % Safety break to prevent infinite loops if gamma becomes too small
            if mk > 50
                break; 
            end
        end

        % Update system with the accepted mk and gamma
        x(k+1) = x_next;
        y(k+1) = y_next;

        f_val_hist(k+1) = f(x(k+1), y(k+1));


% 
%         x(k+1) = x(k) + gamma * d(k,1);
%         y(k+1) = y(k) + gamma * d(k,2);

%         fprintf('gamma: %g\n', gamma);
%         fprintf('d(k): (%g,%g)\n', d(k,1), d(k,2));
%         fprintf('(xk+1,yk+1): (%g,%g)\n', x(k+1), y(k+1));

        k = k+1;
        grad(k,:) = grad_f(x(k), y(k));
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