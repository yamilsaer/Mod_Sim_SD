package Problema10
  model ControlRobot1
  parameter Real h = 0.1, L = 1;
  discrete Real x, y, theta, v, a(start = 1), omega(start = 0.1), phi;
  algorithm
  when sample(h, h) then
    if time < 2 then
      a := 1;
    else
      a := 0;
    end if;
    if time < 1 then
      omega := 0.1;
    elseif time <= 2 + h then
      omega := -0.1;
    else
      omega := 0;
    end if;
    x := pre(x) + h*cos(pre(theta))*cos(pre(phi))*pre(v);
    y := pre(y) + h*sin(pre(theta))*cos(pre(phi))*pre(v);
    theta := pre(theta) + h*sin(pre(phi))*pre(v)/L;
    v := pre(v) + h*pre(a);
    phi := pre(phi) + h*omega;
  end when;
  // El robot se queda girando ya que la velocidad de rotacion y la velocidad quedan positivas constantes
  end ControlRobot1;

  model ControlRobot2
  parameter Real h = 0.1, L = 1;
  discrete Real x, y, theta, v, a, omega, phi, phi_ref;
  parameter Real K_v = 1, K_phi = 2, K_y = 0.5, L0 = 4, v_ref = 2, y_ref = 1;
  algorithm
    when sample(0, h) then
      x := pre(x) + h*cos(pre(theta))*cos(pre(phi))*pre(v);
      y := pre(y) + h*sin(pre(theta))*cos(pre(phi))*pre(v);
      theta := pre(theta) + h*sin(pre(phi))*pre(v)/L;
      v := pre(v) + h*pre(a);
      phi := pre(phi) + h*pre(omega);
      phi_ref := K_y * (atan(y_ref - y)/L0 - theta);
      omega := K_phi * (phi_ref - phi);
      a := K_v * (v_ref - v);
    end when;
  // El robot se acomoda y mantiene estable en el valor de referencia y = 1
  end ControlRobot2;
end Problema10;