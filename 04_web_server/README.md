# Web Server

curl commandで

```
curl localhost:3000/hello
```

と送信すると、

```
Got a connection!
{:VERB=>"GET"}
{:PATH=>"/hello"}
{:VERSION=>"HTTP/1.1"}
{:HEDERS=>[["Host", "localhost:3000"], ["User-Agent", "curl/7.64.1"], ["Accept", "*/*"]]}
```

と返ってくる
