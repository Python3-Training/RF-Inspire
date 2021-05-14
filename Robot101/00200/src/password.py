#!/usr/bin/env python3
import sys

if len(sys.argv) > 2:
   if sys.argv[2] == 'meh':
      print(sys.argv[1])
   else:
      print("try again?")
else:
   print("error")

exit(123)
