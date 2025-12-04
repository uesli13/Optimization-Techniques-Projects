function [H] = hessian_f(x,y)
    ExpTerm = exp(-x.^2 - y.^4);
    
    f_xx = (4*x.^5 - 14*x.^3 + 6*x) .* ExpTerm;
    
    f_yy = (-12*x.^3 .* y.^2 + 16*x.^3 .* y.^6) .* ExpTerm;
    
    f_xy = (-12*x.^2 .* y.^3 + 8*x.^4 .* y.^3) .* ExpTerm;
    
    H = [f_xx, f_xy; f_xy, f_yy];
end