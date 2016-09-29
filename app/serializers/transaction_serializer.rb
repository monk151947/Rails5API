class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :consumer_id, :merchant_id, :sale_amount, :date
end
