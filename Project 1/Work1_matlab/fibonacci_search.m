function [ak, bk, f_min, x_min, k, fun_calls, a_hist, b_hist] = fibonacci_search(fun, a1, b1, l, e)

    F = [1 1];
    while ( F(end) < (b1 - a1) / l )
        F(end+1) = F(end) + F(end-1);
    end
    n = length(F);

    a = [];
    b = [];
    a(1) = a1;
    b(1) = b1;
    
    x1 = a(1) + (F(n-2) / F(n)) * (b(1) - a(1));
    x2 = a(1) + (F(n-1) / F(n)) * (b(1) - a(1));

    f1 = fun(x1);
    f2 = fun(x2);
    fun_calls = 2;
    
    for k = 1 : n-2

        if ( k==n-2 )
            x2 = x1 + e;
            if (f1 > f2)
                a(k+1) = x1;
                b(k+1) = b(k);
            else
                a(k+1) = a(k);
                b(k+1) = x2;
            end
            break;
        end

        if (f1 > f2)
            a(k+1) = x1;
            b(k+1) = b(k);
            x1 = x2;
            f1 = f2;

            x2 = a(k+1) + (F(n-k-1) / F(n-k)) * (b(k+1) - a(k+1));
%             disp(F(n-k-1) / F(n-k));
            f2 = fun(x2);
            fun_calls = fun_calls + 1;

        else
            a(k+1) = a(k);
            b(k+1) = x2;
            x2 = x1;
            f2 = f1;

            x1 = a(k+1) + (F(n-k-2) / F(n-k)) * (b(k+1) - a(k+1));
%             disp(F(n-k-2) / F(n-k));
            f1 = fun(x1);
            fun_calls = fun_calls + 1;
        end

    end
    
    ak = a(end);
    bk = b(end);
    a_hist = a;
    b_hist = b;
    x_min = (ak + bk) / 2;
    f_min = fun(x_min);

end

