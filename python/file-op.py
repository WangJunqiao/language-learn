import io

fw = io.open('aaa.txt', 'w')
fw.write(u'first line\n')
fw.write(u'second line\n')
fw.write(u'third line\n')
fw.close()


fr = io.open('aaa.txt', 'r')
for i in range(2):
    line = fr.readline() # line = u'first line\n', print it will generate an empty line
    line = line.strip('\n')  # use line.strip(' ') to discard them
    print line
fr.close()

fr = io.open('aaa.txt', 'r')
lines = fr.readlines() # read all lines as an array
print lines


