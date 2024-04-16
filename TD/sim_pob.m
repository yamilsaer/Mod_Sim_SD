function [t,x] = sim_pob(f,x0,ti,tf)
  t = [ti:tf];
  x = zeros(1,tf-ti);
  x(:,1) = x0;
  for k = 1:length(t)-1
    x(:,k+1) = f(x,k);
  end
end