# == Schema Information
#
# Table name: bookings
#
#  id         :integer         not null, primary key
#  sporcad_id :integer
#  booked_at  :datetime
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Booking < ActiveRecord::Base
  attr_accessible :booked_at, :sporcad_id
  belongs_to :sporcad
  validates :sporcad_id, :presence => true, :numericality => {:only_integer =>  true}
  validates :booked_at, :presence => true, :uniqueness => true
end
