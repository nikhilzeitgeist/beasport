class Academy < ActiveRecord::Base
  attr_accessible :name
  has_many :sporcads
  has_many :sports, :through => :sporcads
  
end
