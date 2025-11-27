function [ak, bk, f_min, x_min, k, fun_calls, a_hist, b_hist] = dichotomous_search (fun, a1, b1, l, e)

k=0;
x1 = [];
x2 = [];

a = [];
b = [];

a(1) = a1;
b(1) = b1;

while((b(k+1)-a(k+1)) >= l)
    k = k + 1;
    x1(k) = (a(k)+b(k))/2 - e;
    x2(k) = (a(k)+b(k))/2 + e;
        
    if(fun(x1(k)) < fun(x2(k)))
        a(k+1) = a(k);
        b(k+1) = x2(k);
    else
        a(k+1) = x1(k);
        b(k+1) = b(k);
    end
end

ak = a(k+1);
bk = b(k+1);
x_min = (ak+bk)/2;
f_min = fun(x_min);
fun_calls = 2*k;
a_hist = a; 
b_hist = b;
end