#include <iostream>
#include <cmath>
#include <iomanip>
using namespace std;

int main(){
	double x1,y1,x2,y2,x3,y3,x4,y4;
	cin >> x1 >> y1 >> x2 >> y2;
	cin >> x3 >> y3 >> x4 >> y4;
	double temp,l,h;
	bool JIAO=true;
	if(x1<x2){
		temp=x1;
		x1=x2;
		x2=temp;
	}
	if((x3>x1 && x4>x1) || (x4<x2 && x3<x2)){
		JIAO=false;
    }
	if(x1<x3){
		temp=x1;
		x1=x3;
		x3=temp;
	}
	if(x1<x4){
		temp=x1;
		x1=x4;
		x4=temp;
	}
	if(x4>x2){
		temp=x2;
		x2=x4;
		x4=temp;
	}
	if(x4>x3){
		temp=x3;
		x3=x4;
		x4=temp;
	}
	if(y1<y2){
		temp=y1;
		y1=y2;
		y2=temp;
	}
	if(y1<y3){
		temp=y1;
		y1=y3;
		y3=temp;
	}
	if(y1<y4){
		temp=y1;
		y1=y4;
		y4=temp;
	}
	if(y4>y2){
		temp=y2;
		y2=y4;
		y4=temp;
	}
	if(x4>x3){
		temp=x3;
		x3=x4;
		x4=temp;
	}
	l=abs(x2-x3);
	h=abs(y2-y3);
	if(JIAO==true){
		cout << setiosflags(ios::fixed) << setprecision(2) << l*h;
	}
	if(JIAO==false){
		cout << "0.00" << endl;
    }
	return 0;
} 
