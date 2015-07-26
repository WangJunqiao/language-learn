import sys
import os

std = sys.stdin
std.next(a)
std.next(b)
print int(a) + int(b)



try:
    while True:
        a = int(raw_input());
        b = int(raw_input());
        print a + b
except IOError, e:
    ''
