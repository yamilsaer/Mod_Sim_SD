function x1 = sir(x,k)
  N = 1e6;
  alpha = 1;
  gamma = 0.5;
  Sk = x(1);
  Ik = x(2);
  Rk = x(3);
  Sk1 = Sk - alpha * Sk * Ik/N;
  Ik1 = Ik + alpha * Sk * Ik/N - gamma * Ik;
  Rk1 = Rk + gamma * Ik;
  x1 = [Sk1;Ik1;Rk1]; 
end
# x0: S = 1e6-10; I = 10; R = 0

# Hay puntos de equilibrio