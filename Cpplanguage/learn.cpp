#include <iostream>

using namespace std;

void t1()
{
    string text;

	getline(cin, text);
	cout << text << "ok" << endl;

	getline(cin, text, '.');
	cout << text << "ok1" << endl;
}

int main()
{
    double x(12.0);
	int y(13);

	cout.precision(2);
	cout << "Default:" << x << endl;
	cout << "showpoint" << showpoint << x << endl;
	cout << "showpoint " << showpoint << y << endl;
	cout << "fixed" << fixed << x << endl;
	cout << "scientific" << scientific << x << endl;

	t1();

	return 0;
}
