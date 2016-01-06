FactoryGirl.define do
  factory :merchant do
    name "Edgar's Store"
  end

  factory :customer do
    first_name "Edgar"
    last_name "Duran"
  end

  factory :invoice_item do
    unit_price 45
    quantity 3
    item
    invoice
  end

  factory :invoice do
    status "shipped"
    merchant
    customer
  end

  factory :item do
    name "Cool Item"
    description "This item is the best. You gotta have it."
    unit_price 300
    merchant
  end

  factory :transaction do
    credit_card_number "1234567891011121"
    result "success"
    invoice
  end
end
