require 'rails_helper'

RSpec.describe "When I visit '/items/:id'" do
  it "has the item with that id including the item's:
            - name
            - active/inactive status
            - price
            - description
            - image
            - inventory
            - the name of the merchant that sells the item" do
    merchant_2 = Merchant.create( name: "Store Store",
                                  address: "567 Narp Dr.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80203")

    merchant_3 = Merchant.create( name: "Your More Store",
                                  address: "890 Aardvark Dr.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80201")

    batteries = merchant_3.items.create( name: "Batteries",
                          description: "Bunch of loose batteries of undetermined efficacy",
                          price: 4.50,
                          image: 'batteries.jpg',
                          status: 'active',
                          inventory: 10,
                        )

    blanket = merchant_3.items.create( name: "Blanket",
                          description: "Soft and lightweight blanket",
                          price: 4.50,
                          image: '/assets/blanket.png',
                          status: 'inactive',
                          inventory: 4,
                        )

    lightbulb = merchant_2.items.create( name: "Lightbulb",
                          description: "Let there be light",
                          price: 4.50,
                          image: '/assets/lightbulb.jpg',
                          status: 'active',
                          inventory: 12,
                        )

    keys = merchant_2.items.create( name: "Key duplication",
                          description: "Let us create a duplicate key for you fast",
                          price: 4.50,
                          image: '/assets/keys.jpg',
                          status: 'active',
                          inventory: 12,
                        )

    pallet = merchant_2.items.create( name: "Scrap Wood",
                          description: "Reduce, reuse, recycle",
                          price: 4.50,
                          image: '/assets/pallet.jpg',
                          status: 'active',
                          inventory: 12,
                        )
    visit "items/#{batteries.id}"

    expect(page).to have_content("Batteries")
    expect(page).to have_content("Status: active")
    expect(page).to have_content("Bunch of loose batteries of undetermined efficacy")
    expect(page).to have_css("img[src*='batteries']")
    expect(page).to have_content("Inventory: 10")
    expect(page).to have_content("Sold by: Your More Store")

    expect(page).to_not have_content("Lightbulb")

  end
end
# As a visitor
# When I visit '/items/:id'
# Then I see the item with that id including the item's:
# - name
# - active/inactive status
# - price
# - description
# - image
# - inventory
# - the name of the merchant that sells the item
