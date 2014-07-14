FactoryGirl.define  do
  factory :style do
    type "jeans"
    name "bootcut"
    wholesale_price 100
    retail_price 150
  end

  factory :item do
    size "M"
    color "red"
    price_sold 100
    style FactoryGirl.create(:style)
  end

end
