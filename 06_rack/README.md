以下サイトを参考に、Rackへの理解を深める

- https://thoughtbot.com/upcase/videos/rack
- https://github.com/JoelQ/intro-rack-notes
- https://github.com/sunlightlabs/rack-honeypot

## HelloWorld

```
ruby 06_rack/hello_world.rb
```

で実行した後、別ターミナルで以下を実行

```
curl localhost:8080
```

```
Hello World%
```

と表示される

## HelloWorld2

```
ruby 06_rack/hello_world2.rb
```

で実行した後、別ターミナルで以下を実行

```
curl localhost:8080
```

```
["SERVER_SOFTWARE", "thin 1.8.1 codename Infinite Smoothie"]["SERVER_NAME", "localhost"]["rack.input", #<StringIO:0x00007fb0378acc78>]["rack.version", [1, 0]]["rack.errors", #<IO:<STDERR>>]["rack.multithread", false]["rack.multiprocess", false]["rack.run_once", false]["REQUEST_METHOD", "GET"]["REQUEST_PATH", "/"]["PATH_INFO", "/"]["REQUEST_URI", "/"]["HTTP_VERSION", "HTTP/1.1"]["HTTP_HOST", "localhost:8080"]["HTTP_USER_AGENT", "curl/7.64.1"]["HTTP_ACCEPT", "*/*"]["GATEWAY_INTERFACE", "CGI/1.2"]["SERVER_PORT", "8080"]["QUERY_STRING", ""]["SERVER_PROTOCOL", "HTTP/1.1"]["rack.url_scheme", "http"]["SCRIPT_NAME", ""]["REMOTE_ADDR", "127.0.0.1"]["async.callback", #<Method: Thin::Connection#post_process(result) /Users/mbp2021/.rbenv/versions/3.0.2/lib/ruby/gems/3.0.0/gems/thin-1.8.1/lib/thin/connection.rb:95>]["async.close", #<EventMachine::DefaultDeferrable:0x00007fb0350e41a0>]%
```

と表示される
