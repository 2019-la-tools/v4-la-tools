#ifndef NOISE_H
#define NOISE_H

#include <cstdlib>
#include <iostream>
#include <cmath>

using namespace std;

enum NoiseType {ORIGINAL, GAUSSIAN};

class Noise {

private:
	float ratio;
	enum NoiseType type;

public:

	Noise(float ratio, enum NoiseType type);
	float addNoise(float mean, float range);
};

#endif
