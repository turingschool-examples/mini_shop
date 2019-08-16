require 'rails_helper'

describe "Item Index Page" do
  it "shows all items" do
    merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)
    merchant_2 = Merchant.create!(name: "Gridiron Gear", address: "456 East Drive", city: "Longmont", state: "CO", zip: 80501)
    item_1 = merchant_1.items.create!(name: "Memorabilia Helmet",
              description: "A helmet signed by Joe Montana",
              price: 249,
              image: "https://fanatics.frgimages.com/FFImage/thumb.aspx?i=/productimages/_1576000/ff_1576318_xl.jpg&w=900",
              status: "active",
              inventory: 1)
    item_2 = merchant_2.items.create!(name: "Football Cleats",
              description: "Size 10 football cleats",
              price: 79,
              image: "https://i.ebayimg.com/images/g/kp4AAOSw~plc2s04/s-l640.jpg",
              status: "active",
              inventory: 12)
    item_3 =  merchant_2.items.create!(name: "Shoulder Pads",
              description: "Size large shoulder pads",
              price: 129,
              image: "https://boltathletics.com/wp-content/uploads/2016/07/Bolt-Predator-Shoulder-Pad-1.png",
              status: "inactive",
              inventory: 0)

    visit '/items'

    expect(page).to have_link(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_css("img[src*='#{item_1.image}']")
    expect(page).to have_content(item_1.status)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_link(item_1.merchant.name)
    expect(page).to have_link(item_2.name)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content(item_2.price)
    expect(page).to have_css("img[src*='#{item_2.image}']")
    expect(page).to have_content(item_2.status)
    expect(page).to have_content(item_2.inventory)
    expect(page).to have_link(item_2.merchant.name)
    expect(page).to have_link(item_3.name)
    expect(page).to have_content(item_3.description)
    expect(page).to have_content(item_3.price)
    expect(page).to have_css("img[src*='#{item_3.image}']")
    expect(page).to have_content(item_3.status)
    expect(page).to have_content(item_3.inventory)
    expect(page).to have_link(item_3.merchant.name)
  end
end

describe "Merchant Item Index Page" do
  it "shows all items sold by that merchant" do
    merchant_2 = Merchant.create!(name: "Gridiron Gear", address: "456 East Drive", city: "Longmont", state: "CO", zip: 80501)
    item_2 = merchant_2.items.create!(name: "Football Cleats",
              description: "Size 10 football cleats",
              price: 79,
              image: "https://i.ebayimg.com/images/g/kp4AAOSw~plc2s04/s-l640.jpg",
              status: "active",
              inventory: 12)
    item_3 =  merchant_2.items.create!(name: "Shoulder Pads",
              description: "Size large shoulder pads",
              price: 129,
              image: "https://boltathletics.com/wp-content/uploads/2016/07/Bolt-Predator-Shoulder-Pad-1.png",
              status: "inactive",
              inventory: 0)

    visit "/merchants/#{merchant_2.id}/items"

    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content(item_2.price)
    expect(page).to have_css("img[src*='#{item_2.image}']")
    expect(page).to have_content(item_2.status)
    expect(page).to have_content(item_2.inventory)
    expect(page).to have_content(item_3.name)
    expect(page).to have_content(item_3.description)
    expect(page).to have_content(item_3.price)
    expect(page).to have_css("img[src*='#{item_3.image}']")
    expect(page).to have_content(item_3.status)
    expect(page).to have_content(item_3.inventory)
  end

  it "has a link to create a new item" do
    merchant_2 = Merchant.create!(name: "Gridiron Gear", address: "456 East Drive", city: "Longmont", state: "CO", zip: 80501)

    visit "/merchants/#{merchant_2.id}/items"

    expect(page).to have_link("Create New Item")

    click_link "Create New Item"

    expect(current_path).to eq("/merchants/#{merchant_2.id}/items/new")
  end
end
