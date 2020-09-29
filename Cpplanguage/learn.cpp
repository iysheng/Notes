#include <iostream>
#include <fstream>
#include <cmath>

using namespace std;
extern char ** environ;
char **env = environ;
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

class C
{
	private:
		int cnum;

	public:
		C(){};
		C(int c):cnum(c) {};
		int get_cnum()
		{
			return cnum;
		};

		C operator+(const C& c1)
		{
			C c_tmp;

			c_tmp.cnum = cnum * c1.cnum;

			return c_tmp;
		}
};

class A
{
    public:

		virtual void lite()=0;
		virtual int do_hello()
		{
			cout << "hello" << endl;
			return 0;
		};
		void fool()
        {
		    cout << "A fool" << endl;
		};

		virtual ~A()
		{
		    cout << "A destruct" << endl;
		};
		void who_say_hello()
		{
			cout << "It's A" << endl;
		};
};


#define MAX_COUNT 10

class B:public A
{
public:
	int b_test;
	int exchange(int l, int b);
	virtual void who_say_hello()
	{
		cout << "It's B" << endl;
	};
	void test_static_func()
	{
		A::do_hello();
	};

	B(){cout << "B construct func" << endl;};
	B(int i){
		int j = 0;

		if (i > MAX_COUNT)
		{
		    i = MAX_COUNT;
		}

		for (; j < i; j++)
		{
		    data[j] = rand() % 100;
		}
	};
	B operator+(B &b1)
	{
		B temp;

		temp.bnum = bnum + b1.bnum;

		return temp;
	};
	void setnum(int num)
	{
		bnum = num;
	};
	int getnum(void)
	{
		return bnum;
	};
	int sort()
	{
		int i, j;

	    for (i = 0; i < MAX_COUNT; i++)
		{
		    for (j = i + 1; j < MAX_COUNT; j++)
			{
			    if (data[i] > data[j])
				{
				    exchange(i, j);
				}
			}
		}

		return 0;
	};

	void display()
	{
		int i;
		cout << "----- sort ans ----" << endl;
	    for (i = 0; i < MAX_COUNT; i++)
		{
		    cout << data[i] << " ";
		}

		cout << endl;
	}

	void show_env(void)
	{
	    int i = 0;
		for (; env[i] != NULL; i++)
		{
		    cout << env[i] << endl;
		}
	}
	virtual void lite()
	{
	    cout << "B lite" << endl;
	};

	/* 不必要显式声明虚函数定义， 虚函数具有继承性，所以
	 * 总是没有显式声明 fool 是虚函数， fool 也是虚函数
	 * 但是他们的参数列表和返回值要和基函数保持一致
	 * */
	virtual void fool()
    {
	    cout << "B fool" << endl;
	};

	virtual ~B()
	{
	    cout << "B destruct" << endl;
	};

	void fcopy(fstream &f1, ofstream &f2)
	{
		char buffer[512] = {0};
		int num;

	    if (!f1.is_open() || !f2.is_open())
		{
		    cerr << "no open f1 or f2" << endl;
		}

		/* TODO copy f1 to f2 */
		do {
			f1.read(buffer, 512);
			num = f1.gcount();
			f2.write(buffer, num);
		} while(num == 512);
	};

	void fcopy(fstream &f1)
	{
		char buffer[512] = {0};
		int num = 0;

	    if (!f1.is_open())
		{
		    cerr << "no open f1" << endl;
		}

		f1.clear();
		cout << f1.tellg() << "abc" << endl;
		f1.seekg(0, f1.beg);
		/* TODO copy f1 to screen */
		do {
			f1.read(buffer, 512);
			num = f1.gcount();
			cout.write(buffer, num);
		} while(num == 512);
	}
private:
	int bnum;
	int data[MAX_COUNT];
};

int B::exchange(int l, int b)
{
    int temp;

	temp = data[l];
	data[l] = data[b];
	data[b] = temp;

	return 0;
}

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

B g_b[1] = {
    B(10),
};

void t12()
{
    g_b[0].fool();
}

void t13()
{
	g_b[0].display();
    g_b[0].sort();
	g_b[0].display();
}

namespace Nameabc
{
    int abc;
};

namespace Nameabc
{
    int def;
};

void t14()
{
    fstream f1("/tmp/a.c");
    ofstream f2("/tmp/b.c");

	g_b[0].fcopy(f1, f2);
	g_b[0].fcopy(f1);
}

void t15(B &b)
{
   b.b_test = 1;
}

void t16()
{
    A *a_ptr = new B();

    a_ptr->fool();

    delete a_ptr;
}

void t17()
{
	B b;
	b.test_static_func();
}

void t18()
{
	C c1(2), c2(3), c3;

	c3 = c1 + c2;

	cout << c3.get_cnum() << endl;
}

void t19()
{
	B b1, b2, b3;

	b1.setnum(10);
	b2.setnum(20);

	b3 = b1 + b2;

	cout << "first:b3=" << b3.getnum() << endl;
	b3 = b1.operator+(b2);

	cout << "second:b3=" << b3.getnum() << endl;
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

    t19();
	return 0;
}
