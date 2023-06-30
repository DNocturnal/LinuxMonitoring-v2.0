#! /bin/bash

./../01/main.sh ./ 15 adfg 45 hello.all 60kb 
stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 30s
