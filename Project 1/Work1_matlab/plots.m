%% Plot f1(x)
x = linspace(-1, 3, 1000);
y = f1(x);
plot(x,y,'LineWidth', 2);
grid on;
xlabel('x');
ylabel('f1(x)');
title('Plot of f1(x)');

%% Plot f2(x)
x = linspace(-1, 3, 1000);
y = f2(x);
plot(x,y,'LineWidth', 2);
grid on;
xlabel('x');
ylabel('f2(x)');
title('Plot of f2(x)');

%% Plot f3(x)
x = linspace(-1, 3, 1000);
y = f3(x);
plot(x,y,'LineWidth', 2);
grid on;
xlabel('x');
ylabel('f3(x)');
title('Plot of f3(x)');
