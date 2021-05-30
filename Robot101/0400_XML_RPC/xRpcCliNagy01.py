#!/usr/bin/env python3
# File: xRpcCliNagy01.py

import os
import sys
import xmlrpc.client

s = xmlrpc.client.ServerProxy('http://192.168.1.17:9000')
# Call inventory:
for func in s.system.listMethods():
    print("RPC:", func)

# Call our function:
prog = sys.argv[0].split(os.sep)[-1]
print(s.SayHello(prog))

