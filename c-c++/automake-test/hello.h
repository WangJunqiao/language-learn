/*hello.h*/
#ifndef __HELLO_H__
#define __HELLO_H__

#include<stdio.h>

class CHello
{
public:
    CHello(){ printf("hello\n");}
    ~CHello(){ printf("bye!\n");}
};

#endif

