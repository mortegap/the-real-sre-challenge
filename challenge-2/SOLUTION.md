# Challenge 2

-Check the distribution.

```
lsb_release -a
```

-Check CPU usage.

```
sar -u 1 3
```

> Displays real time for all CPUs usage every 1 second up to 3 times

-Check RAM usage. Can you explain the difference of free, used, shared and available stats?

```
sar -r 1 3
```
> Alternative command:
```
free -h
```

free: Amount of memory that is not beign used by any service but that can not be instantly allocated to new or existing processes.
used: Amount of memory that is currently beign used by any service.
shared: Is memory that is beign used by more than one service.
available: Total amount of real memory not beign used by any service.

-List block devices and file system disk.

Block devices:
```
iostat
```

File system disk:
```
sar -F 1 1
```

-Obtain TCP and UDP listen ports.

Easy to watch command:

```
lsof -i -P -n | grep LISTEN
```

Alternative command:

```
netstat -tunlp
```

-Get only PID top 10 process with more CPU usage.

```
pidstat -urd | sort -nr -k 4 | head -10
```

-List all pid which open/used /dev/null.

```
lsof /dev/null
```
