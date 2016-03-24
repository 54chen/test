#include <stdio.h>
#include <string>
#include "test.pb.h"

using namespace std;
using namespace test;
int main()
{
    a a;
    b b;
    a.set_aa(1);
    b.set_allocated_aaa(&a);
    return 0;
}
