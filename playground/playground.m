% defining a function
function [s] = do_stuff (a, b)
  s = a + b
end

I = eye(10); % Identity matrix

% save the variable varname in a readable text file
save file.txt varname -ascii

a(2, :) % second row of a
a(:, 2) % second column of a

v = [1 2 4];
max(v) % maximum of v = 4
[val ind] = max(v); % saves the max and it index

A(:) % matrix to vector (all elements in a single column)
max(A) = max(A, [], 1) % per column max
max(A, [], 2) % per row max

hold on; % plot new figures on top of each other
figure(1); figure(2); % multiple commands
xlabel('x axis label name');
ylabel('y axis label name');
legend('fn name', 'fn2 name'); % add a legend
title('A meaningful title'); 

print -dpng  'file-name.png'; % saves the plot to a file
close; % closes the figure

subplot % to split the figure and draw subplots next to each other
axis % to configure the scale of the axis
clf % clears a figure

imagesc(matrix); %displays a matrix in a figure

a = 1, b = 2, c = 3; % chains the commands