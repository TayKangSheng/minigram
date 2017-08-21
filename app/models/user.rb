class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email, :age
  validates_uniqueness_of :email, case_sensitive: false

  has_many :grams
end
