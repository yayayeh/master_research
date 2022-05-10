#include<iostream>
#include<fstream>
#include<vector>
#include<string>
#include<cstring>
using namespace std;

int main(int argc, char** argv)
{
	fstream input_a, output_time;
	input_a.open(argv[1], ios::in);
    output_time.open(argv[2], ios::out);
	
	string line,function;
	while(getline(input_a, line)) {
		if(line.find("====================") != string::npos) {
			getline(input_a, line);
			//line.erase(line.find("."), line.length());
			function = line;
		}		
		if(line.find("IIS written to file") != string::npos) {
			getline(input_a, line);
			output_time << function << " " << line << " X" << endl;
		}
		if(line.find("Optimal objective:") != string::npos) {
			getline(input_a, line);
			output_time << function << " " << line << endl;
		}
	}
	return 0;
}
