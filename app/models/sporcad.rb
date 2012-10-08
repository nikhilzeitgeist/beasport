class Sporcad < ActiveRecord::Base
  attr_accessible :academy_id, :sport_id
  belongs_to :sport
  belongs_to :academy
end
