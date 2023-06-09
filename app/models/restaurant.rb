class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true#, format: { with: /\A(?:\+65|0)[689]\d{7}\z/, message: "is not a valid Singaporean phone number" }
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian) }
end
