require "rails_helper"

RSpec.describe "merchants creation page", type: :feature do
  it "user can create merchant" do
    merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)
    merchant_2 = Merchant.create(name: "Cherry Corner", address: "456 Basket Cir", city: "Limon", state: "Colorado", zip: 80828)

    visit "/merchants"

    expect(page).to have_link("New Merchant")

    click_on "New Merchant"

    expect(current_path).to eq("/merchants/new")

    fill_in :name, with: "Mango Mall"
    fill_in :address, with: "789 Palm Tree Dr"
    fill_in :city, with: "San Diego"
    fill_in :state, with: merchant_1.state
    fill_in :zip, with: merchant_1.zip

    click_on "Create Merchant"

    # new_merchant = Merchant.last
    expect(current_path).to eq("/merchants")
    expect(page).to have_content("Mango Mall")
  end
end
