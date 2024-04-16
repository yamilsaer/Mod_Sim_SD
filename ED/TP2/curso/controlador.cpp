#include "controlador.h"
void controlador::init(double t,...) {
//The 'parameters' variable contains the parameters transferred from the editor.
va_list parameters;
va_start(parameters,t);
//To get a parameter: %Name% = va_arg(parameters,%Type%)
//where:
//      %Name% is the parameter name
//	%Type% is the parameter type

l_ref = va_arg(parameters,double);
K1 = va_arg(parameters,double);
K2 = va_arg(parameters,double);
xk = l_ref;
sigma = 1e20;
}
double controlador::ta(double t) {
//This function returns a double.
return sigma;
}
void controlador::dint(double t) {
sigma = 1e20;
}
void controlador::dext(Event x, double t) {
//The input event is in the 'x' variable.
//where:
//     'x.value' is the value (pointer to void)
//     'x.port' is the port number
//     'e' is the time elapsed since last transition
double ek = l_ref - x.getDouble();
pk = K1*ek + K2*xk;
if (pk > 1)
	pk = 1;
if (pk < 0)
	pk = 0;
xk += ek;
sigma = 0; 
}
Event controlador::lambda(double t) {
//This function returns an Event:
//     Event(%&Value%, %NroPort%)
//where:
//     %&Value% points to the variable which contains the value.
//     %NroPort% is the port number (from 0 to n-1)

y = pk;
return Event(&y,0);
}
void controlador::exit() {
//Code executed at the end of the simulation.

}
