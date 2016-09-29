# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Inserting consumers..."
consumers = Consumer.create([{ firstname: 'Amit', lastname: 'Patil' }, { firstname: 'Ramesh', lastname: 'Sha' }])

puts "Inserting merchants..."
merchants = Merchant.create([{ name: 'John', domain: 'Garments' }, { name: 'Sumeet', domain: 'Book stall' }, {name: 'Govind', domain: 'Automobiles' }])

#transactions
puts "Inserting transactions..."
Transaction.create(consumer_id: consumers.first.id , merchant_id: merchants.first.id, sale_amount: 1000, date: Time.now )

puts "Done!!!"



