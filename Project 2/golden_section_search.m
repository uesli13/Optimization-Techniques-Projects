function [ak, bk, f_min, x_min, k, fun_calls, a_hist, b_hist] = golden_section_search(fun, a1, b1, l)

gamma = 0.618;

a = [];
b = [];
a(1) = a1;
b(1) = b1;

x1 = a(1) + (1-gamma)*(b(1)-a(1));
x2 = a(1) + gamma*(b(1)- a(1));


f1 = fun(x1);
f2 = fun(x2);

fun_calls = 2;

k=1;

while(b(k) - a(k) >= l)

    if(f1 > f2)

        a(k+1) = x1;
        b(k+1) = b(k);

        x1 = x2;  
        f1 = f2;

        x2 = a(k+1) + gamma*(b(k+1) - a(k+1));
        f2 = fun(x2);

        fun_calls = fun_calls +1;

    else
        a(k+1) = a(k);
        b(k+1) = x2;

        x2 = x1;
        f2 = f1;

        x1 = a(k+1) + (1-gamma)*(b(k+1) - a(k+1));
        f1 = fun(x1);

        fun_calls = fun_calls +1;

    end

    k=k+1;

end

ak = a(k);
bk = b(k);
x_min = (ak+bk)/2;
f_min = fun(x_min );
a_hist = a; 
b_hist = b;

end