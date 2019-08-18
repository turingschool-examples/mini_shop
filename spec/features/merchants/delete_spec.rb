require "rails_helper"

RSpec.describe "merchant delete page", type: :feature do
  it "merchant can be deleted" do
    merchant_1 = Merchant.create(name: "Stuff n' Things", address: "123 North St", city: "Denver", state: "CO", zip: 80203)
    merchant_2 = Merchant.create(name: "The Widget Store", address: "456 East St", city: "Colorado Springs", state: "CO", zip: 80829)
    merchant_3 = Merchant.create(name: "All the Things", address: "789 South St", city: "Boulder", state: "CO", zip: 80301)

    visit "/merchants/#{merchant_1.id}"

    click_link "Delete"

    expect(current_path).to eq("/merchants")

    expect(page).not_to have_content(merchant_1.name)
  end
end
