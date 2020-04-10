class EventVenue < ApplicationRecord
  has_many :events
  validates :name, :address, presence: true
  validates :capacity, numericality: {greater_than_or_equal_to: 10}
end
