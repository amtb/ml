function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;

computePrecision  = @(tp, fp) tp / (tp + fp);
computeRecall     = @(tp, fn) tp / (tp + fn);
computeF1         = @(prec, rec) (2 * prec * rec) / (prec + rec);

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
  
  predictions = pval < epsilon;
  
  % true positives
  tp = sum(predictions == 1 & yval == 1);
  
  % false positives
  fp = sum(predictions == 1 & yval == 0);
  
  % false negatives
  fn = sum(predictions == 0 & yval == 1);
  
  F1 = computeF1(computePrecision(tp, fp), computeRecall(tp, fn));
  
  if F1 > bestF1
     bestF1 = F1;
     bestEpsilon = epsilon;
  end
endfor

end
