x = linspace(-3, 3, 100);
y = linspace(-3, 3, 100);
[X,Y] = meshgrid(x,y) ; 

z = f(X,Y);

surf(x,y,z);
colorbar;
xlabel('X-axis');
ylabel('Y-axis');
zlabel('f(x, y)');
title('Plot of f1(x, y) = x^3 * e^{-(x^2 + y^4)}');