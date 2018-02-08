require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/space'
require './app/models/user'
require './app/models/availability'
require './app/models/booking'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/dwellbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
