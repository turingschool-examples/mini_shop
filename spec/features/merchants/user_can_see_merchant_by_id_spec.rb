require 'rails_helper'

RSpec.describe "individual merchant page", type: :feature do
  it "can see one merchant's name, address, city, state and zip" do
    merchant_1 = Merchant.create(name: "REI",
                                 address: "1234 Smith Street",
                                 city: "Boulder",
                                 state: "Colorado",
                                 zip: "80303")
    merchant_2 = Merchant.create(name: "Moosejaw",
                                 address: "4321 Bob Street",
                                 city: "Denver",
                                 state: "Colorado",
                                 zip: "55555")

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content("Address: #{merchant_1.address}")
    expect(page).to have_content("City: #{merchant_1.city}")
    expect(page).to have_content("State: #{merchant_1.state}")
    expect(page).to have_content("ZIP: #{merchant_1.zip}")

    visit "/merchants/#{merchant_2.id}"

    expect(page).to have_content(merchant_2.name)
    expect(page).to have_content("Address: #{merchant_2.address}")
    expect(page).to have_content("City: #{merchant_2.city}")
    expect(page).to have_content("State: #{merchant_2.state}")
    expect(page).to have_content("ZIP: #{merchant_2.zip}")
  end
end