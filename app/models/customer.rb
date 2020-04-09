class Customer < ApplicationRecord
  has_many :orders
  has_many :tickets, through: :orders
  validates :email, :name, :lastname, presence: true
  validates :email, uniqueness: true
end
