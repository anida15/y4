function J = computeCost(X, y, theta)
    %COMPUTECOST Compute cost for linear regression
    %   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
    %   parameter for linear regression to fit the data points in X and y

    % Initialize some useful values
    m = length(y); % number of training examples

    % Compute hypothesis
    h = X * theta;

    % Compute squared errors
    squared_errors = (h - y) .^ 2;

    % Compute cost
    J = (1 / (2 * m)) * sum(squared_errors);
end
