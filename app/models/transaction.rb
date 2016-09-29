class Transaction < ApplicationRecord
  validates :consumer_id,  presence: true
  validates :merchant_id, presence: true
  validates :sale_amount, presence: true
  validates :date, presence: true
  belongs_to :consumer
  belongs_to :merchant
end
