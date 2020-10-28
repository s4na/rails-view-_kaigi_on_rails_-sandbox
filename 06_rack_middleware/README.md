# Rack Middleware

```
> ruby 06_rack_middleware/web_server.rb
Got a connection!
"env"
{"REQUEST_METHOD"=>"GET",
 "PATH_INFO"=>"/hello",
 "HTTP_VERSION"=>"HTTP/1.1",
 "Host"=>"localhost:3000",
 "User-Agent"=>"curl/7.64.1",
 "Accept"=>"*/*"}
"response"
[200,
 {"X-Request-Took"=>"3.1e-05"},
 ["Hello World: 2020-10-29 02:30:19 +0900"]]
"headers"
{"X-Request-Took"=>"3.1e-05"}
```

```
> curl localhost:3000/hello
```

## Rack Middleware とは

Rack Middleware は Rack と Web Server の間にあるやつ

## memo

responseが帰ってきてないので、なんか間違っている気がする
