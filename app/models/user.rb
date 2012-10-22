class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  has_many :academies, :dependent => :destroy
  has_many :bookings, :dependent => :destroy

  before_save {|user| user.email = email.downcase}
  before_save :add_remember_token

  EMAIL_REGEX_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true, :length => {:maximum => 30}
  validates :email, :presence => true, :format => {:with => EMAIL_REGEX_FORMAT}
  validates :password, :presence => true#, :length => {:minimum => 6}
  validates :password_confirmation, :presence => true

  private
  def add_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
