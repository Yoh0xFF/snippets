#!/bin/sh

ifconfig eth0 down && \
ifconfig eth0 hw ether 78:ac:c0:98:f1:57 && \
ifconfig eth0 up && \
ifconfig eth0 | grep HWaddr
