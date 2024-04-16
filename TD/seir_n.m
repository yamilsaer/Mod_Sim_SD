function x1 = seir_n(x,k)
  TI = 3;
  TR = 12;
  R0 = 1.5;
  N = 1e6;
  
  S = x(1);
  E = x(2);
  I = x(3);
  R = x(4);
  
  Ne = x(5);
  Ne_TI = x(5+TI);
  Ne_TR = x(5+TR);
  
  S_k1 = S - Ne;
  E_k1 = E + Ne - Ne_TI;
  I_k1 = I + Ne_TI - Ne_TR;
  R_k1 = R + Ne_TR;

  Ne_i = x(5:end);
  Ne_i(2:end) = Ne_i(1:end-1);
  Ne_i(1) = R0/(TR - TI) * (I_k1 * S_k1)/N;
  
  x1 = [S_k1;E_k1;I_k1;R_k1;Ne_i];
end

# x0: S = 1e6-10; I = 10; R = 0; E = 0; Ne_i = 0;

# x = [S E I R Ne Ne_TI Ne_TR]