class EventVenue < ApplicationRecord
  has_many :events
  validates :name, :address, presence: true
  validates :capacity, numericality: {greater_than: 10}
end
