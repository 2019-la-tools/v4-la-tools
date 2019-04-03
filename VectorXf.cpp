
#include "VectorXf.h"

using namespace std;

//VectorXf is a dynamically sized float vector
VectorXf::VectorXf(int length) {
	this->length = length;
	this->usesSStot = false;

	data = new float[length];

}

float *VectorXf::getData() {
	return data;
}

int VectorXf::getLength() {
	return length;
}

//SStot is a calculation of the goodness-of-fit of the model
//yBar = [SUM_0^length (y)] / length
//SStot = SUM_0^length (y - yBar)^2
void VectorXf::calculateSStot() {
	// calculate SStot for r-squared

	// 1st get yBar
	float yBar, ySum = 0;
	for (int row_i = 0; row_i < length; row_i++) {
		ySum += data[row_i];
	}
	yBar = ySum / length;

	// 2nd get SStot
	SStot = 0;
	for (int row_i = 0; row_i < length; row_i++) {
		SStot += (data[row_i] - yBar) * (data[row_i] - yBar);
	}

	usesSStot = true;
}

float VectorXf::getSStot() {
	// verify SStot has been calculated
	if (!usesSStot) {
		cout << "You have not calculated SStot yet" << endl;
		return 0;
	}

	return SStot;
}

VectorXf::~VectorXf() {
	delete[] data;
}
