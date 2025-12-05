x = linspace(-10, 10, 100);
y = linspace(-10, 10, 100);
[X, Y] = meshgrid(x, y);

z = f(X, Y);
figure(1);
surf(X, Y, z);

zlim([0 30]); 

colorbar;
xlabel('X-axis');
ylabel('Y-axis');
zlabel('f(x_1, x_2)');
title('Plot of f1(x, y) = (1/3)*x^2 +3*y^2;');
%%
x = linspace(-10, 10, 100);
y = linspace(-10, 10, 100);
[X, Y] = meshgrid(x, y);

z = f(X, Y);

figure(2);
surf(X, Y, z);

% zlim([0 30]); 

colorbar;
xlabel('X-axis');
ylabel('Y-axis');
zlabel('f(x_1, x_2)');
title('Plot of f1(x, y) = (1/3)*x^2 +3*y^2;');