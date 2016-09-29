FactoryGirl.define do
  factory :consumer do
    sequence(:firstname) { |n| "jeff#{n}" }
    sequence(:lastname) { |n| "monk#{n}" }
  end


  factory :merchant do
    sequence(:name) { |n| "rock#{n}" }
    sequence(:domain) { |n| "Garment" }
  end

  factory :transaction do

  end
end