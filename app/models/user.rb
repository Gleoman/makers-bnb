require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,              Serial
  property :name,            Text, required:true
  property :username,        Text, required: true, unique: true
  property :password_digest, Text, required: true

  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
