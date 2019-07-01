FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    price { "9.99" }
    image { "MyString" }
    status { false }
    inventory { 1 }
    merchant { nil }
  end
end
