#!/bin/bash
set -e

service mysql start

sleep 3

tail -f /dev/null