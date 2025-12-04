function [z] = f(x,y)
    z = (x.^3).*exp(-x.^2 - y.^4)  ;
end