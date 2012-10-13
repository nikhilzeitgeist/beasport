class Academy < ActiveRecord::Base
  attr_accessible :name
  has_many :sporcads
  has_many :sports, :through => :sporcads

  validates :name, :presence => true, :length => {:in => 3..20, :message => "length should be between 3 to 20 chars"},
            :uniqueness =>true, :format =>  {:with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed."}
  
end
