require 'rails_helper'

RSpec.describe "On all pages" do
  it "has a link at the top of the page that takes me to the Item Index" do
    merchant_1 = Merchant.create( name: "Corner Store",
                                  address: "234 Yarp Dr.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80211")

    lightbulb = merchant_1.items.create( name: "Lightbulb",
                          description: "Let there be light",
                          price: 4.50,
                          image: '/assets/lightbulb.jpg',
                          status: 'active',
                          inventory: 12,
                        )
    visit '/items'
    expect(page).to have_link("All Items")

    visit '/merchants'
    expect(page).to have_link("All Items")

    visit "/items/#{lightbulb.id}"
    expect(page).to have_link("All Items")

    visit "/merchants/#{merchant_1.id}"
    expect(page).to have_link("All Items")

    visit "/merchants/#{merchant_1.id}/items"
    expect(page).to have_link("All Items")


  end

  it "has a link at the top of the page that takes me to the Merchant Index " do
    merchant_1 = Merchant.create( name: "Corner Store",
                                  address: "234 Yarp Dr.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80211")

    lightbulb = merchant_1.items.create( name: "Lightbulb",
                          description: "Let there be light",
                          price: 4.50,
                          image: '/assets/lightbulb.jpg',
                          status: 'active',
                          inventory: 12,
                        )
    visit '/items'
    expect(page).to have_link("All Merchants")

    visit '/merchants'
    expect(page).to have_link("All Merchants")

    visit "/items/#{lightbulb.id}"
    expect(page).to have_link("All Merchants")

    visit "/merchants/#{merchant_1.id}"
    expect(page).to have_link("All Merchants")

    visit "/merchants/#{merchant_1.id}/items"
    expect(page).to have_link("All Merchants")

  end
end
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Item Index
#
#
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Merchant Index
