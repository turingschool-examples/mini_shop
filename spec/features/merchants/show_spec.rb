require "rails_helper"

RSpec.describe "merchants show page", type: :feature do
  it "user can see the merchants individual information" do
    merch_1 = Merchant.create(name: "Billy", address: "123 Ya moms house Circle", city: "Chicago",
      state: "Illinois", zip: 78047)

    visit "/merchants/#{merch_1.id}"

    expect(page).to have_content("Name: #{merch_1.name}")
    expect(page).to have_content("Address: #{merch_1.address}")
    expect(page).to have_content("City: #{merch_1.city}")
    expect(page).to have_content("State: #{merch_1.state}")
    expect(page).to have_content("Zip Code: #{merch_1.zip}")
  end
end
