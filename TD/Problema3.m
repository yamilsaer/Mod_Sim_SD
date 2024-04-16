S0 = 1e6;
E0 = 0;
I0 = 10;
R0 = 0;
x0 = [S0;E0;I0;R0];
[t,x] = sim_sir(@seir,x0,0,100);
plot(t,x);
title ("Modelo SEIR Discreto");
xlabel ("Tiempo(día)");
ylabel ("Cant. de individuos");
lines = {"Suceptibles","Expuestos","Infectados","Recuperados"};
legend(lines);