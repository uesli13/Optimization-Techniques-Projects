function plot_desmos_style()
    % 1. DESMOS RANGE: Use a small range (-10 to 10), not -300 to 300
    x = linspace(-10, 10, 100); 
    y = linspace(-10, 10, 100);
    [X, Y] = meshgrid(x, y);
    
    % Calculate Z
    z = (1/3).*X.^2 + 3.*Y.^2;

    % 2. CREATE SURFACE
    % 'FaceAlpha', 0.6 makes it semi-transparent (like Desmos)
    % 'EdgeColor', 'none' removes the black grid lines
    surf(X, Y, z, 'FaceAlpha', 0.6, 'EdgeColor', 'none');
    
    % 3. DESMOS AESTHETICS
    axis equal;      % Forces 1 unit X = 1 unit Y (Essential for shape)
    shading interp;  % Smooths the colors
    grid on;         % Keeps the grid on the "floor"
    
    % 4. CLIP THE VIEW (The "Viewport")
    % Desmos clips the top. We must manually tell MATLAB to ignore 
    % z-values higher than ~20, or it will zoom out too far.
    zlim([0 20]); 
    
    % Optional: Labels
    xlabel('X'); ylabel('Y'); zlabel('Z');
    title('Desmos 3D Style: f(x,y) = (1/3)x^2 + 3y^2');
    
    % Lighting helps show the curve better
    camlight; lighting gouraud;
end