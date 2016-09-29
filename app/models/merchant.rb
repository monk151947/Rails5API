class Merchant < ApplicationRecord
  validates :name, presence: true
  validates :domain, presence: true
  has_many :transactions
  has_many :consumers, through: :transactions
end
