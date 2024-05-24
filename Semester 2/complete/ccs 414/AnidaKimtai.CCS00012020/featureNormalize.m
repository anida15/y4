function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where the mean value of each
%   feature is 0 and the standard deviation is 1. This is often a good preprocessing 
%   step to do when working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% Compute the mean of each feature and subtract it from the dataset
mu = mean(X);
X_norm = X - mu;

% Compute the standard deviation of each feature and scale the dataset by dividing each feature by its standard deviation
sigma = std(X_norm);
X_norm = X_norm ./ sigma;

end
