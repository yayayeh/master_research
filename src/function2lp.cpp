#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <map>
#include <math.h>
#include <algorithm>
#include <cstring>
#include <iomanip>
using namespace std;

struct info {
	string name;
	bool complement;
	bool next_plus;
};
void store(string function);
void cacu_table(vector< vector< int > > &minterm);
void cacu_output(vector< vector< int > > &minterm, vector< int > &answer);
void parser_out(vector< vector< int > > &minterm, vector< int > &answer);
void write_ILP(vector< vector< int > > &minterm, vector< int > &answer, int l);

string function;
map< char, int > variable2num;
map< int, char > num2variable;
vector<info> f;

int main(int argc,char *argv[])
{
	fstream fin;
	fin.open(argv[1], fstream::in);
	//input mode select
	if(!fin.is_open()) {
		cout << "Please enter the funcion：";
        cin >> function;
        //function = argv[1];
	}
	else
		fin >> function;
	cout << "F = " << function; //printf function
	cout << endl << endl ; 
 
	//parser
	store(function);
	
	/*vector<struct info>::iterator iter = f.begin();
	for(iter; iter != f.end(); ++iter) { //print F's infomation
		cout << iter->name << " " << iter->complement << " " << iter->next_plus << endl;
	}
	cout << endl;
	for(auto i : variable2num) { //print map variable2num
		cout << i.first << " " << i.second << endl;
	}*/
	
	//creat truth_table
	vector< vector<int> > minterm;
	minterm.resize( pow(2 , variable2num.size()) );
	cacu_table(minterm);
	
	//caculate function output
	vector<int> answer;
	cacu_output(minterm, answer);
	
	//print answer
	cout << setw(7);
	for(auto i: variable2num) { 
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
		if( i % variable2num.size() == 10 )
			cout << "-------------------" << endl;
	}
	
	write_ILP(minterm, answer, 2); 
	//creat f_truth_table.txt
	//parser_out(minterm, answer);
	
	return 0;
}

void cacu_output(vector< vector< int > > &minterm, vector< int > &answer)
{

	for(int i = 0 ; i < minterm.size() ; ++i) {
		int in = 1, sum = 0;
		for(int j = 0 ; j < f.size() ; ++j) {
			int new_in = -1;
			char name = f[j].name[0];

			map< char, int >::iterator it0 = variable2num.find(name), it1 = variable2num.begin();
			int index = distance(it1, it0);

			if( f[j].complement == true ) {		
				if( minterm[i][index] == 1 )
					new_in = 0;
				else
					new_in = 1;
			}
			else
				new_in = minterm[i][index];
			
			in = new_in * in;
			if( f[j].next_plus == true ) {
				sum = sum + in;
				in = 1;
			}
		}
		if( sum >= 1 )
			answer.push_back(1);
		else
			answer.push_back(0);
	}
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
		while( minterm[i].size() < variable2num.size() )
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

void store(string function)
{
	int plus, i = 0;
	string term;
	if( function.find("_") == string::npos ) {
		while( function.length() != 0 ) {
			if ( variable2num.count( function[0] ) == 0) {
				variable2num[ function[0] ] = i;
				num2variable[ i ] = function[0];
				++i;
			}
			if( function.find("'") == 1 ) {
				struct info in;
				in.name = function[0];
				in.complement = true;
				in.next_plus = false;
				if( function.length() == 2 )
					in.next_plus = true;
				else
					in.next_plus = false;
				f.push_back( in );
			}
			else {
				struct info in;
				in.name = function[0];
				in.complement = false;
				in.next_plus = false;
				if( function.length() == 1 )
					in.next_plus = true;
				else
					in.next_plus = false;
				f.push_back( in );
			}
			function.erase(0, 1);
			if( function.find("'") == 0 )
				function.erase(0, 1);
		}
	}
	else {
		while( function.find("_") != string::npos )
		{
			plus = function.find("_");
			term = function.substr(0, plus);
			while( term.length() != 0 ) {
				if ( variable2num.count( term[0] ) == 0) {
					variable2num[ term[0] ] = i;
					num2variable[ i ] = term[0];
					++i;
				}
				if( term.find("'") == 1 ) {
					struct info in;
					in.name = term[0];
					in.complement = true;
					if( term.length() == 2 )
						in.next_plus = true;
					else
						in.next_plus = false;
					f.push_back( in );
				}
				else {
					struct info in;
					in.name = term[0];
					in.complement = false;
					if( term.length() == 1 )
						in.next_plus = true;
					else
						in.next_plus = false;
					f.push_back( in );
				}
				term.erase(0, 1);
				if( term.find("'") == 0 )
					term.erase(0, 1);
			}
			function.erase(0, plus+1);
			if( function.find("_") == string::npos ) {
				while( function.length() != 0 ) {
					if ( variable2num.count( function[0] ) == 0) {
						variable2num[ function[0] ] = i;
						num2variable[ i ] = function[0];
						++i;
					}
					if( function.find("'") == 1 ) {
						struct info in;
						in.name = function[0];
						in.complement = true;
						in.next_plus = false;
						if( function.length() == 2 )
							in.next_plus = true;
						else
							in.next_plus = false;
						f.push_back( in );
					}
					else {
						struct info in;
						in.name = function[0];
						in.complement = false;
						in.next_plus = false;
						if( function.length() == 1 )
							in.next_plus = true;
						else
							in.next_plus = false;
						f.push_back( in );
					}
					function.erase(0, 1);
					if( function.find("'") == 0 )
						function.erase(0, 1);
				}
			}
		}
	}	
}

void parser_out(vector< vector< int > > &minterm, vector< int > &answer)
{
	fstream fout;
    fout.open(function + ".txt", fstream::out);
    if(!fout.is_open())
    {
        cout << "Error: the output file is not opened!!" << endl;
	    exit(1);
    }
	
	fout << endl << "  ";
	fout << "F = " << function;
	fout << endl << endl ; 
	fout << setw(7);
	for(int i = 0 ; i < num2variable.size() ; ++i) { 
		fout << num2variable[i] << " ";
	}
	fout << "f" << endl;
	for(int i = 0 ; i < minterm.size() ; ++i) { 
		fout << setw(3) << i <<" | ";
		for(int j = 0 ; j < minterm[i].size() ; ++j) {
			fout << minterm[i][j] << " ";
		}
		fout << answer[i];
		fout << endl;
		if( i % variable2num.size() == 3 )
			fout << "-------------------" << endl;
	}
}

void write_ILP(vector< vector< int > > &minterm, vector< int > &answer, int l)
{
	fstream outILP;
    outILP.open(function + ".lp", fstream::out);
    if(!outILP.is_open())
    {
        cout << "Error: the output file is not opened!!" << endl;
	    exit(1);
    }

	map<string, int> newVar;
	vector<string> equation;
	vector<string> binary;

	int max=1;
	for(int i=1; i<=l; i++)
		max = max*i;

	for(int i = 0 ; i < minterm.size() ; ++i) { 
		string eq;
	    eq += "P"+to_string(i)+": ";
	    int countZero = 0,countOne = 0;
	    for(int k = 0; k < minterm[i].size(); k++) {
	    	if(minterm[i][k] == 1)
	    		countOne++;
	   		else
	   			countZero++;
	    }
		for(int j = 0 ; j < minterm[i].size() ; j++) {
			if(minterm[i][j] == 1) {
				string s(1, num2variable[j]);
				for(int num=1; num<=l; num++) {
					if(max / num != 1)
						eq += to_string(max/num)+" ";
					string var = "W"+s+to_string(num)+"p";
					eq += var;
					newVar.insert({var, num});
					eq += " - ";

					if(max / num != 1)
						eq += to_string(max/num)+" ";
					string var1 = "W"+s+to_string(num)+"n";
					eq += var1;
					newVar.insert({var1, num});

					if( num < l )
						eq += " + ";
				}
				if( countOne > 1) {
					eq += " + ";
					--countOne;
				}
			}

			if(j == minterm[i].size()-1) {
				if(countZero == minterm[i].size()) {
					for(int num=1; num<=l; num++) {
						if(max / num != 1)
							eq += to_string(max/num)+" ";
						string var = "WT"+to_string(num)+"p";
						eq += var;
						newVar.insert({var, num});
						eq += " - ";

						if(max / num != 1)
							eq += to_string(max/num)+" ";
						string var1 = "WT"+to_string(num)+"n";
						eq += var1;
						newVar.insert({var1, num});

						if(num < l)
							eq += " + ";
					}
					eq += " >= 1";
				}
				else {
					for(int num=1; num<=l; num++) {
						if(num <= l && (countZero != minterm[i].size()))
							eq += " - ";
						if(max/num != 1)
							eq += to_string(max/num)+" ";
						string var = "WT"+to_string(num)+"p";
						eq += var;
						newVar.insert({var, num});
						eq += " + ";

						if(max/num != 1)
							eq += to_string(max / num)+" ";

						string var1 = "WT"+to_string(num)+"n";
						eq += var1;
						newVar.insert({var1, num});
					}
					if(answer[i] == 0)	eq += " <= -1";
					else
						eq += " >= 0";
				}
				
			}

		}
		equation.push_back(eq);
		//cout << endl;
	}

	
	int ASCII=97;
	string s1;
	for(int i = 0; i < newVar.size()/2; i++) {
		s1 =(char)ASCII;
		binary.push_back(s1);
		ASCII++;
	}

	int bound = 5;
	/*for(int i=1, j=0; i<=newVar.size(); i=i+2) {
		cout << "P" << minterm.size()+i << ": ";
		cout << bound << " - " << bound << " " << binary[j] << " - " << newVar[i-1] << " >= 0" << endl;
		cout << "P" << minterm.size()+i << ": ";
		cout << bound << " " << binary[j] << " - " << newVar[i] << " >= 0" << endl;
	}*/

	map<string, int>::iterator it0 = newVar.begin();
	map<string, int>::iterator it1 = newVar.end();
	int i=0, j=0;
	
	for(it0 = newVar.begin(); it0 != newVar.end(); it0++) {
		string eq = "";
		eq += "P" + to_string(minterm.size()+j) + ": ";
		eq += to_string(bound) + " - " + to_string(bound) + " " + binary[i] + " - " + it0->first + " >= 0";
		equation.push_back(eq);
		it0++;
		eq = "";
		eq += "P" + to_string(minterm.size()+j+1) + ": ";
		eq += to_string(bound) + " " + binary[i] + " - " + it0->first + " >= 0";
		equation.push_back(eq);
		i++;
		j+=2;
	}
	cout << endl;

	outILP << "Minimize" << endl << "    ";
	it0 = newVar.begin();
	it1--;
	for(it0 = newVar.begin(); it0 != newVar.end(); it0++) {
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
	for(auto &n: newVar)
		outILP << n.first << " ";
	outILP << endl;

	outILP << "Binary" << endl << "    ";
	for(int i=0; i<binary.size(); i++)
		outILP << binary[i] << " "; 
	outILP << endl;
	outILP << "End" << endl;
}
