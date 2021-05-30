#!/usr/bin/env python3
# File: xRpcCliNagy01.py

import os
import sys
import socket
import xmlrpc.client

ip_port = 9000
ip_address = socket.gethostbyname(socket.gethostname())
s = xmlrpc.client.ServerProxy(f'http://{ip_address}:{ip_port}')
# Call inventory:
for func in s.system.listMethods():
    print("RPC:", func)

# Call our function:
prog = sys.argv[0].split(os.sep)[-1]
print(s.SayHello(prog))


