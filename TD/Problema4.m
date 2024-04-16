S0 = 1e6;
E0 = 0;
I0 = 10;
R0 = 0;
TR = 12;
Ne_i = zeros(TR+1,1);
x0 = [S0;E0;I0;R0;Ne_i];
[t,x] = sim_sir(@seir_n,x0,0,300);
plot(t,x(1:4,:));
title ("Modelo SEIR Discreto con retardos explícitos");
xlabel ("Tiempo(día)");
ylabel ("Cant. de individuos");
lines = {"Suceptibles","Expuestos","Infectados","Recuperados"};
legend(lines);