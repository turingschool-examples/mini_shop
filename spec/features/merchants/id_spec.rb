require "rails_helper"

RSpec.describe "merchants id page", type: :feature do
  it "user can see all merchants info" do
    merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)
    merchant_2 = Merchant.create(name: "Cherry Corner", address: "456 Basket Cir", city: "Limon", state: "Colorado", zip: 80828)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_link("Merchants")
    expect(page).to have_link("Items")

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_1.id)
    expect(page).to have_content(merchant_1.address)
    expect(page).to have_content(merchant_1.city)
    expect(page).to have_content(merchant_1.state)
    expect(page).to have_content(merchant_1.zip)
  end

  it "user can delete merchant" do
    merchant_2 = Merchant.create(name: "Cherry Corner", address: "456 Basket Cir", city: "Limon", state: "Colorado", zip: 80828)

    visit "/merchants/#{merchant_2.id}"

    expect(page).to have_link("Delete Merchant")

    click_on "Delete Merchant"

    expect(current_path).to eq("/merchants")

    expect(page).not_to have_content(merchant_2.name)
  end

  it "user can go to merchant items index page" do
    merchant_2 = Merchant.create(name: "Cherry Corner", address: "456 Basket Cir", city: "Limon", state: "Colorado", zip: 80828)

    visit "/merchants/#{merchant_2.id}"

    expect(page).to have_link("View Items")

    click_on "View Items"

    expect(current_path).to eq("/merchants/#{merchant_2.id}/items")
  end
end
