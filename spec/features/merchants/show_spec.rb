require "rails_helper"

describe "Merchant Show Page" do
  it "shows the merchant info" do
    merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_1.address)
    expect(page).to have_content(merchant_1.city)
    expect(page).to have_content(merchant_1.state)
    expect(page).to have_content(merchant_1.zip)
  end

  it "has a link to to update merchant info" do
    merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_link("Update Merchant")

    click_link "Update Merchant"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")
  end

  it "has a link to delete the merchant" do
    merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_link("Delete Merchant")

    click_link "Delete Merchant"

    expect(current_path).to eq("/merchants")
    expect(page).to_not have_content("#{merchant_1.name}")
  end

#   As a visitor
# When I visit a merchant show page ('/merchants/:id')
# Then I see a link to take me to that merchant's items page ('/merchants/:id/items')

  it "has a link to all items sold by the merchant" do
    merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_link("View Items from this Merchant")

    click_link "View Items from this Merchant"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/items")
  end 

end
