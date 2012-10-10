class Sporcad < ActiveRecord::Base
  attr_accessible :academy_id, :sport_id
  belongs_to :academy
  belongs_to :sport
  has_many :bookings
end
