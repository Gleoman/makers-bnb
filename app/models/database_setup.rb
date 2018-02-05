require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'space'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/dwellbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
