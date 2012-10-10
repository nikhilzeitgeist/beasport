class Booking < ActiveRecord::Base
  attr_accessible :booked_at, :sporcad_id
  belongs_to :sporcad
end
