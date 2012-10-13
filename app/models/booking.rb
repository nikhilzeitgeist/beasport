class Booking < ActiveRecord::Base
  attr_accessible :booked_at, :sporcad_id
  belongs_to :sporcad
  validates :sporcad_id, :presence => true, :numericality => {:only_integer =>  true}
  validates :booked_at, :presence => true, :uniqueness => true
end
