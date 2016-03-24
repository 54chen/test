/**
 * @file    test.cc
 * @author  chenzhen
 * @date    2016-03-24
 * @brief   test.cc
 */

#include <stdio.h>
#include <string>
#include "test.pb.h"

using namespace std;
using namespace test;

void bad_case(){
    a aa;
    b bb;
    aa.set_aa(1);
    bb.set_allocated_aaa(&aa);
}

void good_case1(){
    a *aa = new a();
    b bb;
    aa->set_aa(1);
    bb.set_allocated_aaa(aa);
}

void good_case2(){
    a aa;
    b bb;
    aa.set_aa(1);
    bb.mutable_aaa()->MergeFrom(aa);
}

int main()
{
    //bad_case();
    good_case1();
    good_case2();
    return 0;
}
