#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <map>
#include <vector>
#include <math.h>
#include <algorithm>
#include <iomanip>
using namespace std;

map<string, int> oneWeight;
map<string, int> ilp_objective;
map<string, int> rational;
string function;
int threshold = 0;
int l = 0;

void parser(string line);
bool do_ilp();
void cacu_table(vector< vector< int > > &minterm);
void cacu_output(vector< vector< int > > &minterm, vector< int > &answer);
void writeILP(vector< vector< int > > &minterm, vector< int > &answer, int l);
void writeSol();

int main(int argc, char* argv[]) {
	l = stoi(argv[2]);
	//l = 2;
	ifstream inFile(argv[1], ios::in);
	if(!inFile)
		cerr << argv[1] << "can not be opened!" << endl;
	
	string line;
	//line = "test = 5 A = 1 B = 1 C = 2 D = 3";
	while(getline(inFile, line)) {
		ilp_objective.clear();
		rational.clear();
		threshold = 0;

		parser(line);

		bool f = do_ilp();
		cout << "f= " << f << endl;

		//creat truth_table
		vector< vector<int> > minterm;
		minterm.resize( pow(2 , oneWeight.size()) );
		cacu_table(minterm);

		//caculate function output
		vector<int> answer;
		cacu_output(minterm, answer);

		//print answer
		/*cout << setw(7);
		for(auto i: oneWeight) { 
			cout << i.first << " ";
		}
		cout << "f" << endl;
		for(int i = 0 ; i < minterm.size() ; ++i) { 
			cout << setw(3) << i <<" | ";
			for(int j = 0 ; j < minterm[i].size() ; ++j) {
				cout << minterm[i][j] << " ";
			}
			cout << answer[i];
			cout << endl;
			if( i % oneWeight.size() == 10 )
				cout << "-------------------" << endl;
		}*/
		//f = false;
		if(f)
			writeILP(minterm, answer, l); 
		else
			writeSol();
	}
	return 0;
}

void parser(string line) 
{
	string term, var, weight;
	stringstream ss;

	oneWeight.clear();
	ss.clear();
	ss << line;
	ss >> var >> term >> weight;
	function = var;
	threshold = stoi(weight);
	while(ss >> var >> term >> weight)
		oneWeight.insert({var, stoi(weight)});

	cout << "function: " << function << endl;
	for(auto &n: oneWeight)
		cout << n.first << " " << n.second << endl;
	cout << "threshold: " << threshold << endl;
}

bool do_ilp()
{
	int cost_ori = 0, cost_after = 0;
	cost_ori += threshold;
	for(auto i : oneWeight) {
		cost_ori += abs(i.second);
		if( i.second % 2 == 0 ) { //weight = even
			cost_after += abs(i.second) / 2;
			ilp_objective["W" + i.first + "1n"] = 1;
			ilp_objective["W" + i.first + "1p"] = 1;
		}
		else //weight = odd
		{
			cost_after += 2;
			cost_after += abs(i.second) / 2;
			for(int j = 1; j <= l; j++) {
				ilp_objective["W" + i.first + to_string(j) + "n"] = j;
				ilp_objective["W" + i.first + to_string(j) + "p"] = j;
				rational[i.first] = 0;
			}
		}
	}

	if( threshold % 2 == 0 ) {
		ilp_objective["WT1n"] = 1;
		ilp_objective["WT1p"] = 1;
	}
	else {
		for(int j = 1; j <= l; j++) {
			ilp_objective["WT" + to_string(j) + "n"] = j;
			ilp_objective["WT" + to_string(j) + "p"] = j;
		}
	}

	cost_after += abs(threshold) / 2;
	if(abs(threshold) % 2 == 1)
		cost_after +=2;

	/*for(auto i : ilp_objective) {
		cout << i.first << " " << i.second << endl;
	}
	cout << "ori= " << cost_ori << " after= " << cost_after <<  endl;*/
	if(cost_after < cost_ori)
		return false;
	else
		return true;
}

void cacu_table(vector< vector< int > > &minterm)
{
	int num = 0;
	int quotient = 0, remainder = 0;
	while( num < minterm.size() ) {
		int now = num;
		while( now != 0 ) {
			quotient = now / 2;
			remainder = now % 2;
			now = quotient;
			minterm[num].push_back( remainder );
		}
		++num;
	}
	for(int i = 0 ; i < minterm.size() ; ++i) { //add 0 and reverse
		while( minterm[i].size() < oneWeight.size() )
			minterm[i].push_back(0);
		reverse( minterm[i].begin() , minterm[i].end() );
	}
	/*for(int i = 0 ; i < minterm.size() ; ++i) { //print minterm
		cout << "i= " << i << " ";
		for(int j = 0 ; j < minterm[i].size() ; ++j) {
			cout << minterm[i][j] << " ";
		}
		cout << endl;
	}*/
}

void cacu_output(vector< vector< int > > &minterm, vector< int > &answer)
{
	for(int i = 0 ; i < minterm.size() ; ++i) {
		int sum = 0;
		map<string, int>::iterator it = oneWeight.begin();
		for(int j = 0 ; j < minterm[i].size() ; ++j) {
			sum += minterm[i][j] * it->second;
			++it;
		}
		//cout << "sum= " << sum << endl;
		if( sum >= threshold )
			answer.push_back(1);
		else
			answer.push_back(0);
	}
}

void writeILP(vector< vector< int > > &minterm, vector< int > &answer, int l)
{
	fstream outILP;
    outILP.open(function + ".lp", fstream::out);
    if(!outILP.is_open())
    {
        cout << "Error: the output file is not opened!!" << endl;
	    exit(1);
    }

    map<string, int>::iterator it0, it1;
    vector<string> equation;
    vector<string> binary;

	int max=1;
	for(int i=1; i<=l; i++)
		max = max*i;

	for(int i = 0 ; i < minterm.size() ; ++i) { 
		string eq;
	    eq += "P"+to_string(i)+":";
	    int countZero = 0,countOne = 0;
	    for(int k = 0; k < minterm[i].size(); k++) {
	    	if(minterm[i][k] == 1)
	    		countOne++;
	   		else
	   			countZero++;
	    }
	    
	    it0 = oneWeight.begin();
	    it1 = ilp_objective.begin();
	    //cout << "////////" << minterm[i].size() << endl;
	    for(int j = 0 ; j < minterm[i].size() ; j++) {
	    	int flag = 0;
	    	if(rational.count(it0->first) == 1)
	    		flag = 1;
	    	if(minterm[i][j] == 1) {
	    		if(flag == 1) {
		    		for(int num=1; num<=l; num++) {
						eq += " - ";
						if(max / num != 1)
							eq += to_string(max/num)+" ";
						eq += it1->first;
						++it1;

						eq += " + ";
						if(max / num != 1)
							eq += to_string(max/num)+" ";
						eq += it1->first; 
						++it1;
						//if( num < l )
						//	eq += " + ";
					}
					if( countOne > 1) {
					//	eq += " + ";
						--countOne;
					}
				}
				else {
					eq += " - " + to_string(max) + " ";
					eq += it1->first;
					++it1;
					eq += " + " + to_string(max) + " ";
					eq += it1->first;
					++it1;
				}
				
			}
			else
				if(flag == 1)
					advance(it1, l*2);
				else
					advance(it1, 2);
			++it0;
			
	    

		    if(j == minterm[i].size()-1) {
		    	if(countZero == minterm[i].size()) {
		    		if(threshold % 2 == 0) { //threshold is even
		    			eq += " - " + to_string(max) + " ";
						eq += it1->first;
						++it1;
						eq += " + " + to_string(max) + " ";
						eq += it1->first;
						++it1;
		    		}
		    		else {
		    			for(int num=1; num<=l; num++) {
							eq += " - ";
							if(max / num != 1)
								eq += to_string(max/num)+" ";
							eq += it1->first;
							++it1;

							eq += " + ";
							if(max / num != 1)
								eq += to_string(max/num)+" ";
							eq += it1->first; 
							++it1;
							//if( num < l )
							//	eq += " + ";
						}
		    		}
		    		if(answer[i] == 0)	eq += " >= 1";
					else	eq += " <= 0";
		    	}
		    	else {
		    		if(threshold % 2 == 0) { //threshold is even
		    			eq += " + " + to_string(max) + " ";
						eq += it1->first;
						++it1;
						eq += " - " + to_string(max) + " ";
						eq += it1->first;
						++it1;
		    		}
		    		else {
		    			for(int num=1; num<=l; num++) {
							eq += " + ";
							if(max / num != 1)
								eq += to_string(max/num)+" ";
							eq += it1->first;
							++it1;

							eq += " - ";
							if(max / num != 1)
								eq += to_string(max/num)+" ";
							eq += it1->first; 
							++it1;
							//if( num < l )
							//	eq += " + ";
						}
		    		}
		    		if(answer[i] == 0)	eq += " <= -1";
					else	eq += " >= 0";
		    	}
		    }
	

	    }
	    //cout << eq << endl;
	    equation.push_back(eq);
	    //cout << "---------" << endl;
	}

	int ASCII = 97, ASCII1 = 97;
	string s1;
	for(int i = 0; i < ilp_objective.size()/2; i++) {
		s1 = "";
		if(ASCII > 122) {
			s1 +=(char)97;
			s1 +=(char)ASCII1;
			ASCII1++;
		}
		else {
			s1 +=(char)ASCII;
			ASCII++;
		}
		binary.push_back(s1);
	}

	int bound = 100;

	it0 = ilp_objective.begin();
	it1 = ilp_objective.end();
	int i=0, j=0;
	
	for(it0 = ilp_objective.begin(); it0 != ilp_objective.end(); it0++) {
		string eq = "";
		eq += "P" + to_string(minterm.size()+j) + ": ";
		eq += to_string(bound) + " - " + to_string(bound) + " " + binary[i] + " - " + it0->first + " >= 0";
		equation.push_back(eq);
		//cout << eq << endl;
		it0++;
		eq = "";
		eq += "P" + to_string(minterm.size()+j+1) + ": ";
		eq += to_string(bound) + " " + binary[i] + " - " + it0->first + " >= 0";
		equation.push_back(eq);
		i++;
		j+=2;
		//cout << eq << endl;
	}

	j=0;
	for(int i=0; i<binary.size(); i++) {
		string eq = "";
		eq += "P" + to_string(minterm.size()+binary.size()*2+j) + ": ";
		eq += binary[i] + " >= 0";
		equation.push_back(eq);

		eq = "";
		eq += "P" + to_string(minterm.size()+binary.size()*2+j+1) + ": ";
		eq += binary[i] + " <= 1";
		equation.push_back(eq);
		j+=2;
	}
	cout << endl;

	outILP << "Minimize" << endl << "    ";
	it0 = ilp_objective.begin();
	it1--;
	for(it0 = ilp_objective.begin(); it0 != ilp_objective.end(); it0++) {
		if(it0->second != 1)
			outILP << it0->second << " ";
		outILP << it0->first;
		if(it0 != it1)
			outILP << " + ";
	}
	outILP << endl;

	outILP << "Subject To" << endl << "    ";
	for(int i=0; i<equation.size(); i++) {
		outILP << equation[i] << endl;
		if(i != equation.size()-1)
			outILP << "    ";
	}

	outILP << "Integer" << endl << "    ";
	for(auto &n: ilp_objective)
		outILP << n.first << " ";
	for(int i=0; i<binary.size(); i++)
		outILP << binary[i] << " "; 
	outILP << endl;
	outILP << "End" << endl;
}

void writeSol()
{
	fstream outSol;
    outSol.open(function + ".sol", fstream::out);
    if(!outSol.is_open())
    {
        outSol << "Error: the output file is not opened!!" << endl;
	    exit(1);
    }

	int cost = 0;
	vector<string> binary;

	if(abs(threshold) % 2 == 1)
		rational.insert({"T", 0});
	oneWeight.insert({"T", threshold});
	
	for(auto i : oneWeight) {
		if( abs(i.second) % 2 == 1 ) //weight = odd
			cost += 2;
		cost += abs(i.second) / 2;
	}
	outSol << "# Objective value = " << cost << endl;

	vector<int> ans;
	
	for(auto &n: oneWeight) {
		int sign = (n.second > 0) ? 1 : 0;
    	if(rational.count(n.first) == 0) { 
    		if(sign) {
				ans.push_back(0);
				ans.push_back(abs(n.second) / 2);
    		}
    		else {
    			ans.push_back(abs(n.second) / 2);
    			ans.push_back(0);
    		}
    	}
    	else {
    		if(sign) {
    			ans.push_back(0);
				ans.push_back(abs(n.second) / 2);
				ans.push_back(0);
				ans.push_back(abs(n.second) % 2);
    		}
    		else {
    			ans.push_back(abs(n.second) / 2);
    			ans.push_back(0);
    			ans.push_back(abs(n.second) % 2);
    			ans.push_back(0);
    		}
    	}
	}

	map<string, int>::iterator it = ilp_objective.begin();
	for(int i=0; i<ans.size(); i++) {
		outSol << it->first << " " << ans[i] << endl;
		++it;
	}

	int ASCII = 97, ASCII1 = 97;
	string s1;
	for(int i = 0; i < ilp_objective.size()/2; i++) {
		s1 = "";
		if(ASCII > 122) {
			s1 +=(char)97;
			s1 +=(char)ASCII1;
			ASCII1++;
		}
		else {
			s1 +=(char)ASCII;
			ASCII++;
		}
		binary.push_back(s1);
	}
	outSol << "5 7" << endl;
	for(int i=1; i<=ans.size(); i++) {
		if(i%2 == 1 && ans[i] >= 1) {
			outSol << binary[i/2] << " ";
			outSol << "1" << endl;
		}
		else if (i%2 == 1) {
			outSol << binary[i/2] << " ";
			outSol << "0" << endl;
		}
		
	}
}