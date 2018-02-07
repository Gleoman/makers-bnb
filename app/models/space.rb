class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, Numeric, required: true

  has n, :availabilities, :through => Resource

  def self.remove_availability(space_id, availability_id)
    space_availability = AvailabilitySpace.get(space_id, availability_id)
    space_availability.destroy
  end
end
