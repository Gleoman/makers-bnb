class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, Numeric, required: true
	property :picture_url, Text, required: true

  belongs_to :user
  has n, :availabilities, :through => Resource
  has n, :bookings

  def self.remove_availability(space_id, date_from, date_to)
    range = (date_from..date_to).to_a
    range.each { |date|
      availability = Availability.first(:date => date)
      space_availability = AvailabilitySpace.get(space_id, availability.id)
      space_availability.destroy
    }
  end
end
