function [error, diff] = computeSquaredError(X, y, theta)
  m     = size(X, 1);
  h     = X * theta;
  diff  = h - y;
  error = (1 / (2 * m) ) * sum(diff .^ 2);
end