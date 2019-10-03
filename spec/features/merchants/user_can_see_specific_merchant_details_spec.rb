require 'rails_helper'

RSpec.describe "individual merchant detail page", type: :feature do
  it "can see the details for a specific merchant" do
    merchant_1 = Merchant.create(name: "Sedona", address: "123 Main Street", city: "Denver", state: "CO", zip: "80218")

    visit merchants_path

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_1.address)
    expect(page).to have_content(merchant_1.city)
    expect(page).to have_content(merchant_1.state)
    expect(page).to have_content(merchant_1.zip)
  end
end
