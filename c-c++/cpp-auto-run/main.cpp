#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <ctime>
#include <iostream>

using namespace std;

struct AA {
    int a;
    char ch;
    char ch2;
};

union UU {
    int a;
    int b;
};

#define offsetof(s, m)  ((size_t)(&(((s *)0)->m)))

int main() {
    cout << sizeof(AA) << endl;
    cout << sizeof(UU) << endl;
    cout << offsetof(AA, ch2) << endl;
}

