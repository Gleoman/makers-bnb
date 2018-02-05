class User
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :username, Text, required: true, unique: true
  property :password, Text, required: true
end
