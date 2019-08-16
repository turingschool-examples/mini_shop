require "rails_helper"

RSpec.describe "merchants edit page", type: :feature do
  it "user can edit merchant" do
    merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)
    merchant_2 = Merchant.create(name: "Cherry Corner", address: "456 Basket Cir", city: "Limon", state: "Colorado", zip: 80828)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_link("Update Merchant")

    click_on "Update Merchant"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")

    fill_in :name, with: "The Mango Mall"
    fill_in :address, with: "110 Coconut Cir"
    fill_in :city, with: "Los Angeles"
    fill_in :state, with: "CA"
    fill_in :zip, with: "33333"

    click_on "Update Merchant"

    # new_merchant = Merchant.last
    expect(current_path).to eq("/merchants/#{merchant_1.id}")
    expect(page).to have_content("The Mango Mall")
    expect(page).to have_content("110 Coconut Cir")
    expect(page).to have_content("Los Angeles")
    expect(page).to have_content("CA")
    expect(page).to have_content("33333")
  end
end
