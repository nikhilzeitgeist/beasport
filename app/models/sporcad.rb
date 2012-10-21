# == Schema Information
#
# Table name: sporcads
#
#  id         :integer         not null, primary key
#  academy_id :integer
#  sport_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Sporcad < ActiveRecord::Base
  attr_accessible :academy_id, :sport_id
  belongs_to :academy
  belongs_to :sport
  has_many :bookings

  validates :academy_id, :sport_id, :presence => true, :numericality => {:only_integer =>  true}
end
