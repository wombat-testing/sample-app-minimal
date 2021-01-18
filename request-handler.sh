#!/bin/sh

timeout 1 cat - >/dev/null
printf "HTTP/1.1 200 OK\n\nHello world!"

