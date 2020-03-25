#include<iostream>
#include<iomanip>
#include<algorithm>
using namespace std;
int a(int n, int k)
{
	int x;
	if(n==k)
	{
		x = 1;
		return x;
	}
	if (k == 0)
	{
		x = 1;
		return x;
	}
	x =a(n - 1, k - 1) + a(n-1, k );
	return x;

}
int main()
{
	int n;
	int k;
	cin >> n >> k;
	int x = a(n, k);
	cout << x;
}

