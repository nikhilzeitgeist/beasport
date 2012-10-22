# == Schema Information
#
# Table name: academies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Academy < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :sporcads, :dependent => :destroy
  has_many :sports, :through => :sporcads

  validates :name, :presence => true, :length => {:in => 3..20, :message => "length should be between 3 to 20 chars"},
            :uniqueness =>true, :format =>  {:with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed."}
  validates :user_id, :presence => true, :numericality => {:only_integer =>  true}
end
