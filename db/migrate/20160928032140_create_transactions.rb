class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :consumer, index: true
      t.belongs_to :merchant, index: true
      t.decimal :sale_amount
      t.date :date

      t.timestamps
    end
  end
end
