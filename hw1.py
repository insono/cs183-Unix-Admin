import sys

for i in range(len(sys.argv)-1):
   file = open(sys.argv[i+1], "r")
   print file.read()
   file.close()
