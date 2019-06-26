require "rails_helper"

RSpec.describe "merchants show page", type:
:feature do
  it "user can see merchant corresponding to id including the merchant's name, address, city, state, and zip" do
    merchant_1 = Merchant.create(name: "Thai Tanic", address: "12600 Feet Under the Sea", city: "North Atlantic Ocean", State: "SOS", Zip: 1912)
    

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_1.address)
    expect(page).to have_content(merchant_1.city)
    expect(page).to have_content(merchant_1.zip)

    # expect(page).to have_content(merchant_2.name)
    # expect(page).to have_content(merchant_2.address)
    # expect(page).to have_content(merchant_2.city)
    # expect(page).to have_content(merchant_2.zip)
    #
    # expect(page).to have_content(merchant_3.name)
    # expect(page).to have_content(merchant_3.address)
    # expect(page).to have_content(merchant_3.city)
    # expect(page).to have_content(merchant_3.zip)
  end
end
