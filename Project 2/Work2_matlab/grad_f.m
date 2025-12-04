function [grad] = grad_f(x,y)
    grad = [(3 - 2.*x.^2) .* x.^2 .* exp(-x.^2 -y.^4) , -4.*y.^3 .* x.^3 .* exp(-x.^2 -y.^4) ];
end