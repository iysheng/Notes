#include <iostream>
#include <cmath>

using namespace std;

void t1()
{
    string text;

	getline(cin, text);
	cout << text << "ok" << endl;

	getline(cin, text, '.');
	cout << text << "ok1" << endl;
}

void t2()
{
    float f0, f1;

	cout << "Input float f0 and f1:" << endl;
	cin >> f0 >> f1;
	cout << "f0=" << f0 << " f1=" << f1 << endl;
	return;
}

void t3()
{
	int a;
    int x = (a = 3, 12);

	cout << "x=" << x << endl;
}

void t4()
{
    int i(1), j(1);

	for (; i < 10; i++)
	{
		for (j = 1; j < 10; j++)
		{
			cout << i * j << '\t';
		}
		cout << endl;
	}
}

#ifndef ABS
#define ABS(a) (((a) < 0) ? (-(a)) : (a));
#endif

#define CLS         (cout << "\033[2J")
#define LOCATE(z,s) (cout << "\033[" << (z) << ';' << (s) << 'H')
#define PI          3.1415926
#define START       0.0
#define END         (2 * PI)
#define PNT         64
#define STEP        ((END-START) / PNT)
#define xA          14
#define yA          10

void t5()
{
    int row, column;

	CLS;
	LOCATE(2, 25);
    cout << "The sine func" << endl;
	LOCATE(xA, 1);
	for (column = 1; column < 78; ++column)
	{
	    cout << ((column - yA) % 8 ? '\304' : '\305');
	}
	cout << '\020';
    LOCATE(xA-1, yA+64);
	cout << "2PI x";
	for (row = 5; row < 24; row++)
	{
	    LOCATE(row, yA);
		cout << '\305';
	}
	LOCATE(4, yA);
	cout << "\036 sin(x)";
	LOCATE(xA-8, yA+1);
	cout << " 1";
	LOCATE(xA+8, yA+1);
	cout << " -1";
	int begpt = yA;
	int endpt = begpt + PNT;
    for (column =  begpt; column <= endpt; ++column)
	{
	    double x =  (column - yA) * STEP;
		row = (int)(xA - 8 * sin(x) + 0.5);
		LOCATE(row, column);
		cout << '*';
	}
	LOCATE(25,1);
}

void t6()
{
	string s1("As time by ...");
	string s2 = "goes ";
	int i;

	cout << s1 << "npos=" << string::npos << endl;
	i = s1.find("by");
	s1.erase(i+2);

	s1.insert(i, s2);
	i = s1.find("time");
	s1.replace(i, 4, "Bill");

	cout << s1 << endl;
}

int t7(int a, int b = 1, int c = 2)
{
    cout << "a,b,c=" << a + b + c << endl;
    return a + b + c;
}

float t7(float a, float b, float c)
{
    cout << "float abc=" << a + b + c << endl;
    return a + b + c;
}

long long t8(int a)
{
	long long b = 1;

	if (a)
	{
	    b = a * t8(a-1);
	}
	
	return b;
}

class ABC
{
	private:
		static int count;

	public:
		int abc;
		ABC();
		ABC(class ABC& abc);
		static inline int get_count()
		{
		    return count;
		}
};

int ABC::count = 0;

#if 0
ABC::ABC(class ABC& pm)
{
	count++;
	this->abc = pm.abc;
}
#else
ABC::ABC(class ABC& pm):abc(pm.abc)
{
    count ++;
}
#endif

ABC::ABC()
{
    count++;
    abc = 1;
}

int t9()
{
    ABC A1;
	cout << A1.abc << endl;
	A1.abc = 2;
	ABC A2(A1);
	cout << A2.abc << endl;

	cout << A1.get_count() << endl;

	return 0;
}

class A
{
    public:
		virtual void lite()=0;
		virtual void fool()
        {
		    cout << "A fool" << endl;
		};

		virtual ~A()
		{
		    cout << "A destruct" << endl;
		};
};

class B:public A
{
    public:
		virtual void lite()
		{
		    cout << "B lite" << endl;
		};

		virtual void fool()
        {
		    cout << "B fool" << endl;
		};

		virtual ~B()
		{
		    cout << "B destruct" << endl;
		};
};

void t10()
{
    A *a = new B();
	a->fool();
	a->lite();
	delete a;
}

void t11()
{
    B b;
}

int main()
{
#if 0
    double x(12.0);
	int y(13);

	cout.precision(2);
	cout << "Default:" << x << endl;
	cout << "showpoint" << showpoint << x << endl;
	cout << "showpoint " << showpoint << y << endl;
	cout << "fixed" << fixed << x << endl;
	cout << "scientific" << scientific << x << endl;

	t7(1,2,3);
	t7((float)1.1, (float)2.1, (float)3.1);
#endif

	t10();

	return 0;
}
