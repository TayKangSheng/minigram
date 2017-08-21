class Gram < ApplicationRecord
  validates_presence_of :title, :content, :location

  belongs_to :user
end
