# Rackの話がよくわからなかったので、調査

- [Rails Guides/Rails on Rack](https://railsguides.jp/rails_on_rack.html)
- [Rack](https://rack.github.io/)
- [leah blogs/Introducing Rack](http://leahneukirchen.org/blog/archive/2007/02/introducing-rack.html)

> Informally, a Rack application is a thing that responds to #call and takes a hash as argument, returning an array of status, headers and a body.

つまり、Rackは gem 'rack' に限らず、「 `#call` で配列を返すPORO」というインターフェースの規格ということ？？
