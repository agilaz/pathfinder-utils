class User < ApplicationRecord
  has_secure_password
  has_many :characters

  validates_presence_of :password
  validates_confirmation_of :password

  validates_presence_of :username
  validates_uniqueness_of :username
end
