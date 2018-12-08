from code_tester import rand, show, reader, randomize

t = 1
args = reader()
if(len(args)>0):
    t = rand(int(args[0]))


print(t)
for test in range(t):
    """
    main test case loop
    """

