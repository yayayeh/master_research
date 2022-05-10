#include<iostream>
#include<fstream>
#include<vector>
#include<string>
#include<cstring>
using namespace std;

struct info{
	bool un_sloved;
	double time;
};

int main(int argc, char** argv)
{
	fstream input_a, output_time;
	input_a.open(argv[1], ios::in);
    output_time.open(argv[2], ios::out);
	
	vector<info> time;
	time.resize(5110);
	
	string line;
	int function;
	while(getline(input_a, line)) {
		if(line.find("====================") != string::npos) {
			getline(input_a, line);
			line.erase(0,1);
			line.erase(line.find("."), line.length());
			function = stoi(line);
		}
		if(line.find("IIS written to file") != string::npos) {
			getline(input_a, line);
			time[function].time = stod(line);
			time[function].un_sloved = true;
		}
		if(line.find("Optimal objective:") != string::npos) {
			getline(input_a, line);
			time[function].time = stod(line);
			time[function].un_sloved = false;
		}
	}
	
	for(int i=0; i<5110; i++) {
		output_time << "f" << i << ".lp ";
		output_time << time[i].time << " "; 
		if(time[i].un_sloved)
			output_time << "X";
		output_time << endl;
	}
	return 0;
}
