# Rails View Routing Sandbox

Kaigi on Railsでのアーロンさんの発表を元に、RailsのView Routingを作る

## app/first_web_server.rb

Start Web Server

```
# terminal 1
ruby ./app/first_web_server.rb
```

Send request

```
# terminal 2
curl localhost:3000/hello
curl: (52) Empty reply from server
```

Receive reqponse

```
# terminal 1
Read: GET /hello HTTP/1.1
Read: Host: localhost:3000
Read: User-Agent: curl/7.64.1
Read: Accept: */*
Read:
```

## app/second_web_server.rb

Start Web Server

```
# terminal 1
ruby ./app/second_web_server.rb
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

## refs

[Kaigi on Rails STAY HOME Editon](https://www.youtube.com/watch?v=q0CH1tB7e_o)
