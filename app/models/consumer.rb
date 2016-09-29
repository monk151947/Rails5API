class Consumer < ApplicationRecord
  validates :firstname, presence: true
  validates :lastname, presence: true
  has_many :transactions
  has_many :merchants, through: :transactions
end
