function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1); % Initialize vector to store cost history

% Perform gradient descent
for iter = 1:num_iters
    % Compute hypothesis
    h = X * theta;
    
    % Compute errors
    errors = h - y;
    
    % Update theta values simultaneously using gradient descent
    theta = theta - (alpha / m) * X' * errors;

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
end

end
