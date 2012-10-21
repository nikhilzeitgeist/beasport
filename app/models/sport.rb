# == Schema Information
#
# Table name: sports
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Sport < ActiveRecord::Base
  attr_accessible :name
  has_many :sporcads
  has_many :academies, :through => :sporcads
  validates :name, :presence => true, :length => {:in => 3..20, :message => "length should be between 3 to 20 chars"},
            :uniqueness =>true, :format =>  {:with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed."}
end
