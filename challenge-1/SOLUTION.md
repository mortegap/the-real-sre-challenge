# Challenge 1

1. Count all lines with 500 HTTP code.

```
cat sample.log | grep -c "500"
```

2. Count all GET requests from yoko to /rrhh location and was OK (200).

```
cat sample.log | grep "yoko" | grep "GET /rrhh" | grep -c "200"
```

3. How many requests go to /?

```
cat sample.log | grep -c "/\""
```

4. Count all lines without 5XX HTTP code.

```
grep -c -v '5[0-9]\{2\}' sample.log
```

5. Replace all 503 HTTP code by 500, how many requests have 500 HTTP code?

Before the replace:

```
grep -c '500' sample.log
```
Output:
714

> 714 lines that contains 500

After the replacing command:

```
sed -i 's/503/500/g' sample.log
```
Output:
1469

> 1469 lines that contains 500
