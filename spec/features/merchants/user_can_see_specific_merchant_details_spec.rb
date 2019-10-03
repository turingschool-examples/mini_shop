require 'rails_helper'

RSpec.describe "individual merchant detail page", type: :feature do
  it "can see the details for a specific merchant" do
    merchant_1 = Merchant.create(name: "Sedona", address: "123 Main Street", city: "Denver", state: "CO", zip: "80218")
    merchant_2 = Merchant.create(name: "Fun Fitness", address: "Another street", city: "Denver", state: "CO", zip: "80218")

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_1.address)
    expect(page).to have_content(merchant_1.city)
    expect(page).to have_content(merchant_1.state)
    expect(page).to have_content(merchant_1.zip)
    expect(page).not_to have_content(merchant_2.name)
  end
end
