class Booking
  include DataMapper::Resource

  property :id,   Serial
  property :date_from, Date, required true
  property :date_to, Date, required true
  property :confirmed, Boolean, :default => false

  belongs_to :space , :user

end
