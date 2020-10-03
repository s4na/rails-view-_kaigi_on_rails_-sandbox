# second_web_server

Start Web Server

```
# terminal 1
ruby ./second_web_server.rb
```

Send request

```
# terminal 2
curl localhost:3000/hello
```

Receive response

```
# terminal 1
Read: GET /hello HTTP/1.1
Read: Host: localhost:3000
Read: User-Agent: curl/7.64.1
Read: Accept: */*
Read:
```

Receive response

```
# terminal 2
Hello World
```
