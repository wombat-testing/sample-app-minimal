#!/bin/sh

timeout 1 cat - >/dev/null
echo -e "HTTP/1.1 200 OK\n\nHello world!"

