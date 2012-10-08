class Sport < ActiveRecord::Base
  attr_accessible :name
  has_many :sporcads
  has_many :academies, :through => :sporcads
end
