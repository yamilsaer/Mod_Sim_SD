package Problema5
    model discreteSIR
    parameter Real N = 1e6;
    discrete Real S(start = N), I(start = 10), R;
    parameter Real alpha = 1, gamma = 0.5;
  algorithm
      when sample(0, 1) then
        S := pre(S) - alpha*pre(S)*pre(I)/N;
        I := pre(I) + alpha*pre(S)*pre(I)/N - gamma*pre(I);
        R := pre(R) + gamma*pre(I);
      end when;
  end discreteSIR;

  model discreteSEIR
  parameter Real N = 1e6;
  discrete Real S(start = N), I(start = 10), R, E;
  parameter Real alpha = 1, gamma = 0.5, mu = 0.5;
  algorithm
    when sample(0, 1) then
      S := pre(S) - alpha*pre(S)*pre(I)/N;
      E := pre(E) + alpha*pre(S)*pre(I)/N - mu*pre(E);
      I := pre(I) + mu*pre(E) - gamma*pre(I);
      R := pre(R) + gamma*pre(I);
    end when;

  end discreteSEIR;

  model discreteSEIR_n
  parameter Real N = 1e6, R0 = 1.5;
  parameter Integer TI = 3, TR = 12;
  discrete Real S(start = N), I(start = 10), R, E,Ne,Ni[TR];
  parameter Real alpha = 1, gamma = 0.5, mu = 0.5;
  algorithm
    when sample(0, 1) then
      Ne := R0/(TR-TI) * I*S/N;
      S := pre(S) - pre(Ne);
      E := pre(E) + pre(Ne) - Ni[TI];
      I := pre(I) + Ni[TI] - Ni[TR];
      R := pre(R) + Ni[TR];
      Ni[2:TR] := Ni[1:TR-1];
      Ni[1] := pre(Ne);
    end when;

  end discreteSEIR_n;
end Problema5;