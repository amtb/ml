function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
Prediction      = X * Theta';
Errors          = Prediction - Y;
GradedErrors    = Errors .* R;
SquaredErrors   = GradedErrors .^ 2;

regularization  = (lambda / 2) * (sum(sum(Theta .^ 2)) + sum(sum(X .^ 2)));
J               = 0.5 * sum(sum(SquaredErrors)) + regularization;

X_grad          = GradedErrors * Theta;
Theta_grad      = GradedErrors' * X;

for i=1:size(X_grad, 1)
  X_grad(i, :) += lambda * X(i, :);
endfor

for i=1:size(Theta_grad, 1)
  Theta_grad(i, :) += lambda * Theta(i, :);
endfor


grad = [X_grad(:); Theta_grad(:)];

end
