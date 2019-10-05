require 'rails_helper'

describe "All Merchant Items" do
  it "Can list all items and descriptions for one merchant" do
    best_buy = Merchant.create(
      name: 'Best Buy',
      address: '123 Main St',
      city: 'Lakewook',
      state: 'CO',
      zip: '80128'
    )
    best_buy.items.create(
      name: "Macbook Pro 13\"",
      description: "Apple Macbook Pro 13\" 8GB DDR3 Memory",
      price: '1299',
      image: 'https://images-na.ssl-images-amazon.com/images/I/61SJu997CCL._SL1500_.jpg',
      status: 'Active',
      inventory: '730',
    )

    visit "/merchants/#{best_buy.id}/items"
    expect(page).to have_content("Macbook Pro 13\"")
    expect(page).to have_content("Apple Macbook Pro 13\" 8GB DDR3 Memory")
    expect(page).to have_content('Price: $1299')
    expect(page).to have_content('Status: Active')
    expect(page).to have_content('Stock: 730')
  end
end
