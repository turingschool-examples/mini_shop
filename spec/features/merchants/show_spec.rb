require "rails_helper"

RSpec.describe "merchant show page", type: :feature do
  it "shows display merchant info" do
    merchant_1 = Merchant.create(name: "Stuff n' Things", address: "123 North St", city: "Denver", state: "CO", zip: 80203)
    merchant_2 = Merchant.create(name: "The Widget Store", address: "456 East St", city: "Colorado Springs", state: "CO", zip: 80829)
    merchant_3 = Merchant.create(name: "All the Things", address: "789 South St", city: "Boulder", state: "CO", zip: 80301)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_1.address)
    expect(page).to have_content(merchant_1.city)
    expect(page).to have_content(merchant_1.state)
    expect(page).to have_content(merchant_1.zip)
  end
end
