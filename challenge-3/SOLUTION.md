# Challenge 3

Commands used:

1. chmod +x challenge3.sh
2. bash ./challenge.3 -h 

```
#!/bin/bash

help() {
        echo "Usage: challenge-3.sh [options..]"
        echo ""
        echo "Display system info based on passed flags."
        echo "challenge-3.sh description options: "
        echo "
        -d, --disk       check disk stats
        -c, --cpu        check cpu stats
        -p, --ports      check listen ports
        -r, --ram        check ram stats
        -o, --overview   top 10 process with more CPU usage."
}

while getopts 'hdcpro' flag; do
  case $flag in
    h) help
    exit;;
    d) sar -F 1 1 
    exit;;
    c) sar -u 1 3 
    exit;;
    p) lsof -i -P -n | grep LISTEN
    exit;;
    r) sar -r 1 3 
    exit;;
    o) pidstat -urd | sort -nr -k 4 | head -10 
    exit;;
    *) help
    exit;;
  esac
done
```
