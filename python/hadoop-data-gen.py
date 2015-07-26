__author__ = 'dd'

import os
import sys
import random

words = []
hadoop_dir = " /user/hadoop/input/"
command = "/usr/local/hadoop/bin/hadoop fs -moveFromLocal "
def gen_meta_words(num):
    for i in range(num):
        L = random.randint(1, 5)
        word = ''
        for j in range(L):
            word = word + chr(random.randint(ord('a'), ord('a') + 25))
        words.append(word)

def gen_file(fname, word_num):
    print 'generate ' + fname, ('word_num = %d' % word_num)
    f = open(fname, "w")
    for i in range(word_num):
        f.write(words[random.randint(0, len(words) - 1)] + "\n")
    f.close()
    os.system(command + fname + hadoop_dir)


file_num = 100
prefix = ''
word_per_file = 100000

usage = '''
-fn: define the file number we need to gen.
-p: add a prefix to each generated file.
-wpf: define the words each file contains
'''

def print_usage():
    print usage


if __name__ == '__main__':
    gen_meta_words(100)

    for i in range(1, len(sys.argv), 2):
        if i + 1 >= len(sys.argv):
            print 'error arguments!!!'
            print_usage()
            exit(-1)
        if sys.argv[i] == '-fn':
            file_num = int(sys.argv[i + 1])
        elif sys.argv[i] == '-p':
            prefix = sys.argv[i + 1]
        elif sys.argv[i] == '-wpf':
            word_per_file = int(sys.argv[i + 1])
        else:
            print 'error arguments!!!'
            print_usage()
            exit(-1)
    for i in range(file_num):
        gen_file(prefix + str(i), word_per_file)
