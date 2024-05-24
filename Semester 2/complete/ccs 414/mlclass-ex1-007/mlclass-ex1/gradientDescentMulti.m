function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(X, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Number of training examples
m = length(y); 

% Initialize J_history to store the cost
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % Compute hypothesis
    h = X * theta;

    % Compute errors
    errors = h - y;

    % Compute delta (gradient)
    delta = (1/m) * (X' * errors);

    % Update theta
    theta = theta - alpha * delta;

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
