table = {
  'users' => {
    'new' => { :this => [UsersController. :new] },
    :this => [UsersController, :index]
  },
  'shops' => {
    'new' => { :this => [ShopsController, :new] },
    :this => [ShopsController, :index]
  }
}

def find_route(path, table)
  path.split('/').drop(1).inject(table) { |t, name|
    t[:name]
  }[:this]
end

p find_route('/users/new', table) # => [UsersController, :new]
p find_route('/users', table) # => [UsersController, :index]
p find_route('/shops', table) # => [ShopsController, :index]
