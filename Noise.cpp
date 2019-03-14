#include "Noise.h"

Noise::Noise(float ratio, enum NoiseType type) {
	this->ratio = ratio;
	this->type = type;
}

float Noise::addNoise(float mean, float range) {

	if(this->type == ORIGINAL){
		float noise = static_cast <float> (rand()) / static_cast <float> (RAND_MAX);

		float noiseRange = ratio * range;
		float noisy = mean + (noise * noiseRange) - (noiseRange / 2);

		cout << "Range: " << range << ", NoiseRange: " << noiseRange << ", value:noisy: " << mean << "\t" << noisy << endl;

		return noisy;
	}else if (this->type == GAUSSIAN)
	{
		const double PI = 3.14159265358979323846; //not declared in cmath.
		float u, v;
		do{
			u = static_cast <float> (rand()) / static_cast <float> (RAND_MAX); //generate U on [0, 1).
		}while(u == 0); // force it to (0, 1) while maintaining distribution.

		do{
			v = static_cast <float> (rand()) / static_cast <float> (RAND_MAX); //generate V on [0, 1).
		}while(v == 0); // force it to (0, 1) while maintaining distribution.

		//Use the Box-Mueller Method to generate a gaussian, or normally distributed number.
		//We only generate X because we don't need to generate a second number.
		float x = sqrt((-2) * log(u)) * (cos(2 * PI * v)); // x is now a normally distributed random number.
		float noisy = mean + x; // apply noise to value.

		cout << "value:noisy: " << mean << "\t" << x << endl;

		return noisy;
	}
}
