//CPP:curso/cola.cpp
#if !defined cola_h
#define cola_h

#include "simulator.h"
#include "event.h"
#include "stdarg.h"

#include "queue"


class cola: public Simulator { 
// Declare the state,
// output variables
// and parameters

// estado
bool busy;
std::queue<double> q;
double sigma;

// salida
double y;
public:
	cola(const char *n): Simulator(n) {};
	void init(double, ...);
	double ta(double t);
	void dint(double);
	void dext(Event , double );
	Event lambda(double);
	void exit();
};
#endif
