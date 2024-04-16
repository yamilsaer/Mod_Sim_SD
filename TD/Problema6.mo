package Problema6

model DiscreteSIRimp
  parameter Real N = 1e6;
  discrete Real S(start = N), I, R,imp,exp;
  parameter Real alpha = 1, gamma = 0.5, m=0.01;
algorithm
  when sample(0, 1) then
    S := pre(S) - alpha * pre(S) * pre(I) / N;
    I := pre(I) + alpha * pre(S) * pre(I) / N - gamma * pre(I) + imp - exp;
    R := pre(R) + gamma * pre(I);
    exp:= m* pre(I);
  end when;
end DiscreteSIRimp;

model MultiSIR
  DiscreteSIRimp M1(I.start = 10), M2;
algorithm
  when sample(0, 1) then
    M1.imp := pre(M2.exp);
    M2.imp := pre(M1.exp);
  end when;
end MultiSIR;

model MultiSIR_2
  DiscreteSIRimp M1(I.start = 10), M2, M3;
algorithm
  when sample(0, 1) then
    M1.imp := 0.5 * pre(M2.exp);
    M2.imp := pre(M1.exp) + pre(M3.exp);
    M3.imp := 0.5 * pre(M2.exp);
  end when;
end MultiSIR_2;

end Problema6;