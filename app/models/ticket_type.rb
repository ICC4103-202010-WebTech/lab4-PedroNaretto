class TicketType < ApplicationRecord
  belongs_to :event
  validates :ticket_price, numericality: {greater_than: 0}
end
