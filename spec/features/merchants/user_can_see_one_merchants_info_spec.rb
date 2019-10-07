require 'rails_helper'

RSpec.describe "merchants show page", type: :feature do
  it "can see merchant's information" do
    merchant_1 = Merchant.create( name: "Corner Store",
                                  address: "234 Yarp Dr.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80211")
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

    visit "/merchants/#{merchant_1.id}"
    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_1.address)
    expect(page).to have_content(merchant_1.city)
    expect(page).to have_content(merchant_1.state)
    expect(page).to have_content(merchant_1.zip)
    expect(page).to_not have_content(merchant_2.name)
    expect(page).to_not have_content(merchant_3.name)

    visit "/merchants/#{merchant_2.id}"
    expect(page).to have_content(merchant_2.name)
    expect(page).to have_content(merchant_2.address)
    expect(page).to have_content(merchant_2.city)
    expect(page).to have_content(merchant_2.state)
    expect(page).to have_content(merchant_2.zip)
    expect(page).to_not have_content(merchant_1.name)
    expect(page).to_not have_content(merchant_3.name)

    visit "/merchants/#{merchant_3.id}"
    expect(page).to have_content(merchant_3.name)
    expect(page).to have_content(merchant_3.address)
    expect(page).to have_content(merchant_3.city)
    expect(page).to have_content(merchant_3.state)
    expect(page).to have_content(merchant_3.zip)
    expect(page).to_not have_content(merchant_1.name)
    expect(page).to_not have_content(merchant_2.name)


  end

  it "has a link to take the user to that merchant's items page ( '/merchants/:id/items')" do
    merchant_3 = Merchant.create( name: "Your More Store",
                                  address: "890 Aardvark Dr.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80201")

    batteries = merchant_3.items.create( name: "Batteries",
                          description: "Bunch of loose batteries of undetermined efficacy",
                          price: 4.50,
                          image: 'batteries.jpeg',
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

    visit "/merchants/#{merchant_3.id}"
    click_link "See all items at Your More Store"
    expect(current_path).to eq("/merchants/#{merchant_3.id}/items")
  end
end
