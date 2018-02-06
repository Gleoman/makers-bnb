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

  def self.authenticate(username, login_password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == login_password
      user
    else
      nil
    end
  end
end
