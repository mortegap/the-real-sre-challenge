# Challenge 4

DOCKERFILE
```
FROM python:3

ADD server.py /

CMD [ "python", "./server.py" ]
```

Commands used for building and running container:

```
1- docker build -t challenge-4:latest -t challenge-4:v1 .
2- docker run -d -p 8080:8080 challenge-4:latest

```

Command to pass header to the server:

```
curl --header "Challenge: intelygenz.com" 127.0.0.1:8080
```

> Output: Everything works!
