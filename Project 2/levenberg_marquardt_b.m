function [x_hist, y_hist, f_val_hist, k, x_min, y_min, f_min] = levenberg_marquardt_b(x1,y1, e, f, grad_f, hessian_f)

    x = [];
    y = [];
    f_val_hist = [];
    grad = [];
    d = [];

    x(1) = x1;
    y(1) = y1;
    f_val_hist(1) = f(x1, y1);
    grad(1,:) = grad_f(x(1),y(1));

    a1=0;
    b1=4;
    l=0.001;

    k = 1;
    max_iter = 10000;

    while norm(grad(k,:)) >= e && k < max_iter

        H = hessian_f(x(k), y(k));
       
        eig_H = eig(H);
        lamda_min =  min(eig_H);

        if lamda_min > 0
            mk = 0;
        else 
            mk = abs(lamda_min) + 0.1;
        end    


        d_vec = - (H + mk*eye(2)) \ grad(k,:)';

        d(k,:) = d_vec';

        fun = @(gamma) f( x(k) + gamma*d(k,1) ,y(k) + gamma*d(k,2) );
        [~, ~, ~, gamma, ~, ~, ~, ~] = golden_section_search(fun, a1, b1, l);

        x(k+1) = x(k) + gamma*d(k,1);
        y(k+1) = y(k) + gamma*d(k,2);
        
        f_val_hist(k+1) = f(x(k+1), y(k+1));

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