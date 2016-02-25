FactoryGirl.define do

  factory :customer do
    first_name
    last_name
    created_at Time.now
    updated_at Time.now
  end

  sequence :first_name do |n|
    "#{n} first_name"
  end

  sequence :last_name do |n|
    "#{n} last_name"
  end

  factory :merchant do
    name
    created_at Time.now
    updated_at Time.now
  end

  sequence :name do |n|
    "#{n} name"
  end

  factory :invoice do
    customer
    merchant
    status 'success'
    created_at Time.now
    updated_at Time.now
  end

  factory :item do
    name
    description
    unit_price
    merchant
    created_at Time.now
    updated_at Time.now
  end

  sequence :description do |n|
    "#{n} description"
  end

  sequence :unit_price do |n|
    n * 100
  end

  factory :transaction do
    invoice
    credit_card_number
    result 'success'
    created_at Time.now
    updated_at Time.now
  end

  sequence :credit_card_number do |n|
    "#{n * 1000}"
  end

  factory :invoice_item do
    item
    invoice
    unit_price
    quantity
    created_at Time.now
    updated_at Time.now
  end

  sequence :quantity do |n|
    n
  end

end
