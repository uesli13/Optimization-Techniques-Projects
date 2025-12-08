x1 = linspace(-10, 10, 100);
x2 = linspace(-10, 10, 100);
[X1, X2] = meshgrid(x1, x2);

z = f(X1, X2);
figure(1);
surf(X1, X2, z);

zlim([0 30]); 

colorbar;
xlabel('X1-axis');
ylabel('X2-axis');
zlabel('f(x_1, x_2)');
title('Plot of f1(x_1, x_2) = (1/3)*x_1^2 +3*x_2^2;');
%%
x = linspace(-10, 10, 100);
y = linspace(-10, 10, 100);
[X1, X2] = meshgrid(x, y);

z = f(X1, X2);

figure(2);
surf(X1, X2, z);

% zlim([0 30]); 

colorbar;
xlabel('X1-axis');
ylabel('X2-axis');
zlabel('f(x_1, x_2)');
title('Plot of f1(x_1, x_2) = (1/3)*x_1^2 +3*x_2^2;');
