function x1 = pob2(x,k)
  a = 0.01;
  b = 0.1;
  x1 = x(:,k) + b*x(:,k) - a*x(:,k)^2;
end

# Hay puntos de equilibrio en x(k) = 0 y en x(k) = 10 