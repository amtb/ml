function output = nn_layer(inputs, weights)
  inputs = [ones(size(inputs), 1) inputs];
  
  z = inputs * weights';
  output = sigmoid(z);
  
end