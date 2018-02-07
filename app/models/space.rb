class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, Numeric, required: true

  has n, :availabilities, :through => Resource
  has n, :bookings
end
