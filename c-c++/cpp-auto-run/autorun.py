import time
import os
import sys
import hashlib

def get_files_recursive(f):
    if (os.path.isfile(f)):
        return set([f])
    if (f[-1] != '/'):
        f = f + '/'
    ret = set()
    for s in os.listdir(f):
        ret = ret | get_files_recursive(f + s)
    return ret

if __name__ == '__main__':
    work_dir = '.'
    if (len(sys.argv) >= 2):
        work_dir = sys.argv[1]
    if (work_dir[-1] != '/'):
        work_dir = work_dir + '/'
    print 'working dir: %s' % work_dir
    
    mp = {}
    while (True):
        files = get_files_recursive(work_dir)
        modified = False
        for f in files:
            md5 = hashlib.md5(open(f, 'rb').read()).hexdigest()
            if (f not in mp or md5 != mp[f]):
                mp[f] = md5
                modified = True
        if (modified):
            os.system('sh ' + work_dir + 'run.sh')
        time.sleep(1)


