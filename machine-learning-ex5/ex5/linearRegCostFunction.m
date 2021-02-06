function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 

[sqErr, diff] = computeSquaredError(X, y, theta);
reg           = sum(theta(2:end) .^ 2);
J             =  sqErr + (1 / (2 * m)) * (lambda * reg);
grad          = (1 / m) * (diff' * X);

factor = (lambda / m);
for j = 2:length(theta)
  grad(j) += factor * theta(j);
endfor

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
% =========================================================================

grad = grad(:);

end
