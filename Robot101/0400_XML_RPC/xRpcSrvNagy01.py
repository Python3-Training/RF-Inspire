#!/usr/bin/env python3
# File: xRpcSrvNagy01.py

import socket
from xmlrpc.server import SimpleXMLRPCServer
from xmlrpc.server import SimpleXMLRPCRequestHandler


class zHan(SimpleXMLRPCRequestHandler):
    rpc_paths = ('/RPC2',) # default

ip_port = 9000
ip_address = socket.gethostbyname(socket.gethostname())

print("Server:", ip_address, "@", ip_port)

with SimpleXMLRPCServer((ip_address, ip_port), requestHandler=zHan) as server:
    server.register_introspection_functions()
    
    class MyServices:
        def SayHello(self, param):
            return ip_address + ':' + str(ip_port) + ' |Hello ' + param + '!'

    server.register_instance(MyServices())
    server.serve_forever()
