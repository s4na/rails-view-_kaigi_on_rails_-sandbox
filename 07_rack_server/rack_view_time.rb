class RackViewTime
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    headers[:time] = Time.now.to_s

    [status, headers, body]
  end
end
