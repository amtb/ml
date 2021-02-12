function centroid = computeCentroid(X, clusterX)  [m n] = size(X);  count = sum(clusterX);    sumXi = zeros(1, n);  for i = 1:m    if clusterX(i)      sumXi = sumXi + X(i, :);    endif
    endfor      centroid = sumXi / count;
endfunction