% Computes the output (activation) of a layer based on the input and the weights
function [z, a] = nnLayer(input, weights)
  input = [ones(size(input), 1) input];
  z = input * weights';
  a = sigmoid(z);
