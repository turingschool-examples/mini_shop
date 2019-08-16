require 'rails_helper'

describe "Item Show Page" do
  it "shows the item info" do
    merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)
    item_1 = merchant_1.items.create!(name: "Memorabilia Helmet",
              description: "A helmet signed by Joe Montana",
              price: 249,
              image: "https://fanatics.frgimages.com/FFImage/thumb.aspx?i=/productimages/_1576000/ff_1576318_xl.jpg&w=900",
              status: "active",
              inventory: 1)

    visit "/items/#{item_1.id}"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_xpath("//img[@src='#{item_1.image}']")
    expect(page).to have_content(item_1.status)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(item_1.merchant.name)
  end

  it "has a link to to update item info" do
    merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)
    item_1 = merchant_1.items.create!(name: "Memorabilia Helmet",
              description: "A helmet signed by Joe Montana",
              price: 249,
              image: "https://fanatics.frgimages.com/FFImage/thumb.aspx?i=/productimages/_1576000/ff_1576318_xl.jpg&w=900",
              status: "active",
              inventory: 1)

    visit "/items/#{item_1.id}"

    expect(page).to have_link("Update Item")

    click_link "Update Item"

    expect(current_path).to eq("/items/#{item_1.id}/edit")
  end

  it "has a link to delete the merchant" do
    merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)
    item_1 = merchant_1.items.create!(name: "Memorabilia Helmet",
              description: "A helmet signed by Joe Montana",
              price: 249,
              image: "https://fanatics.frgimages.com/FFImage/thumb.aspx?i=/productimages/_1576000/ff_1576318_xl.jpg&w=900",
              status: "active",
              inventory: 1)

    visit "/items/#{item_1.id}"

    expect(page).to have_link("Delete Item")

    click_link "Delete Item"

    expect(current_path).to eq("/items")
    expect(page).to_not have_content(item_1.name)
    expect(page).to_not have_content(item_1.description)
  end
end
