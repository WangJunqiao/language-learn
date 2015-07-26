__author__ = 'dd'

# simulate a stack use a list

stack = []

prompt = '''
Commands:
p:push
s:show_elements
o:pop
q:quit
Enter choice:
'''


def push():
    stack.append(raw_input("Enter a new string: ").strip())


def show_elements():
    print stack


def pop():
    if len(stack) == 0:
        print 'Cannot pop from an empty stack!'
    else:
        print 'Removed [', stack.pop(), ']'

CMDs = {'p': push, 's': show_elements, 'o': pop}

while True:
    while True:
        try:
            choice = raw_input(prompt).strip()[0].lower()
        except (EOFError, KeyboardInterrupt, IndexError):
            choice = 'q'

        if choice not in 'psoq':
            print 'Invalid options, try again'
        else:
            break
    if choice == 'q':
        break
    CMDs[choice]()


