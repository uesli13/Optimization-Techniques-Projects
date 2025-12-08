function [proj_x] = proj_x(x)
    a1 = -10;
    b1 = 5;
    a2 = -8;
    b2 = 12;

    if x(1) < a1
        proj_x(1) = a1;
    elseif x(1) > b1
            proj_x(1) = b1;
    else
        proj_x(1) = x(1);
    end

    if x(2) < a2
        proj_x(2) = a2;
    elseif x(2) > b2
            proj_x(2) = b2;
    else
        proj_x(2) = x(2);
    end
end