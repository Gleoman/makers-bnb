class User
  include DataMapper::Resource

  property :id, Serial
  property :name, Text, required: true
  property :username, Text, required: true, unique: true
  property :password, Text, required: true
end
