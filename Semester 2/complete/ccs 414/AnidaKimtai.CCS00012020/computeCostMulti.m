function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Number of training examples
m = length(y); 

% Compute hypothesis
h = X * theta;

% Compute squared errors
squared_errors = (h - y).^2;

% Compute cost
J = 1/(2*m) * sum(squared_errors);

end
