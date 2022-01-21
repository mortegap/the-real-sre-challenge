# Challenge 5

^@ characters are Null characters (ASCII value 000) so when I tried to open it with a plain text editor (as vim) it is unreadable.

I opened it with next commands:

```
$ strings blackbox
$ strace -f ./blackbox
```

And saw that it makes reference to a "the_magic_filez.txt" file. So I created it and when I run the script:

```
$ ./blackbox
```

> Output: Congrats! :)
