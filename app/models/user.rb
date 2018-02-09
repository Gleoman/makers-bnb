require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,              Serial
  property :name,            Text, required:true
  property :username,        Text, required: true, unique: true
  property :password_digest, Text, required: true
  property :email_address, String, required: true, unique: true

  has n, :bookings
  has n, :spaces

  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, login_password)
    user = first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == login_password
  end
end
