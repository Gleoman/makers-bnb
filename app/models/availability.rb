class Availability
  include DataMapper::Resource

  property :id,   Serial
  property :date, Date, required: true

  has n, :spaces, :through => Resource
end
