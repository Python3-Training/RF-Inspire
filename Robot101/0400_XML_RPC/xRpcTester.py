#!/usr/bin/env python3
# File: xRpcTester.py

import socket
import xmlrpc.client

ip_port = 9000
ip_address = socket.gethostbyname(socket.gethostname())

def SayHello(message, host=ip_address, port=ip_port):
    s = xmlrpc.client.ServerProxy(f'http://{host}:{port}')
    test_result = s.SayHello(message)
    return test_result.split('|')[1]

    

