function x1 = seir(x,k)
  N = 1e6;
  alpha = 1;
  gamma = 0.5;
  mu = 0.5;
  Sk = x(1);
  Ek = x(2);
  Ik = x(3);
  Rk = x(4);
  
  Sk1 = Sk - alpha * Sk * Ik/N;
  Ek1 = Ek + alpha * Sk * Ik/N - mu * Ek;
  Ik1 = Ik + mu * Ek - gamma * Ik;
  Rk1 = Rk + gamma * Ik;
  
  x1 = [Sk1;Ek1;Ik1;Rk1]; 
end

# x0: S = 1e6-10; I = 10; R = 0; E = 0

# Hay puntos de equilibrio