
require "rails_helper"

RSpec.describe "item index page", type: :feature do

  it "can see all items with information" do
    merchant_1 = Merchant.create(name: "Stuff n' Things", address: "123 North St", city: "Denver", zip: 80203, state: "CO")
    item_1 = Item.create!(name: "Widget", description: "Does what you need it to do", price: 10, image: 'http://images-na.ssl-images-amazon.com/images/I/71cCfpruJ6L._SX679_.jpg', active: true, inventory: 10, merchant: merchant_1)
    #binding.pry

    visit "/items"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_1.active)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(item_1.merchant.name)
  end
end
