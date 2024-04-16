function x1 = pob(x,k)
  b = 0.1;
  d = 0.02;
  x1 = x(:,k) + b*x(:,k) - d*x(:,k);
end
