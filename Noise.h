#ifndef NOISE_H
#define NOISE_H

#include <cstdlib>
#include <iostream>
#include <cmath>

using namespace std;

class Noise {

private:
	float ratio;
	enum {ORIGINAL, GAUSSIAN} type;

public:

	Noise(float ratio);
	float addNoise(float mean, float range);
};

#endif
