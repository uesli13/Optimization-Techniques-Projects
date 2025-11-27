function [ak, bk, f_min, x_min, k, fun_calls, a_hist, b_hist] = bisection_der(fun, a1, b1, l)

a = [];
b = [];
a(1) = a1;
b(1) = b1;
fun_calls = 0;

n=0;
while (1/2)^n > l/(b(1)-a(1))
    n=n+1;
end

h = 1e-6;

for k = 1:n

    x = (a(k) +b(k))/2;

    dfxk = (fun(x+h) - fun(x-h)) / (2*h);    

    fun_calls = fun_calls + 2;

    if( dfxk>0 )
        a(k+1) = a(k);
        b(k+1) = x;
    else
        a(k+1) = x;
        b(k+1) = b(k);
    end

end

ak = a(k);
bk = b(k);
a_hist = a;
b_hist = b;
x_min = (ak+bk)/2;
f_min = fun(x_min);

end



