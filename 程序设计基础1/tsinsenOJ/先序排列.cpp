#include <iostream>
#include <cstring>
using namespace std;

void findbefore(string in,string after){
	if(in.size()>0){
		char root=after[after.size()-1];
		cout << root;
		int s=in.find(root);
		findbefore(in.substr(0,s),after.substr(0,s));
		findbefore(in.substr(s+1),after.substr(s,in.size()-s-1));
	}
}
int main(){
	string inord,afterord;
	cin >> inord >> afterord;
	findbefore(inord,afterord);
	cout << endl;
	return 0;
} 
