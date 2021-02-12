function idx = findClosestCentroid(xi, centroids)
  
  getDistance = @(centroid) (xi - centroid) * (xi - centroid)';
  
  K = size(centroids, 1);
  minDistance = Inf;
  
  for k = 1:K
    d = getDistance(centroids(k, :), xi);
    if d < minDistance
      idx = k;
      minDistance = d;
    endif
  endfor
end
