require 'rails_helper'

RSpec.describe "Merchant Items Index Page", type: :feature do
  before(:each) do
    @merchant_1 = Merchant.create!(name: "Iris Watson", address: "8562 Fusce Rd.", city: "Frederick", state: "NB", zip: 20620)

    @item_1 = @merchant_1.items.create!(
      name: "Rainier Cherries",
      description: "Rainier Cherries, 2 lbs",
      price: 15.99,
      image: "https://images.costcobusinessdelivery.com/ImageDelivery/imageService?profileId=12028466&itemId=53747&recipeName=680",
      status: TRUE,
      inventory: 200
    )

    @item_2 = @merchant_1.items.create!(
      name: "Nectarines",
      description: "White Flesh Premium Nectarines, 5 lbs",
      price: 9.99,
      image: "https://d1fywv0iz2cv2w.cloudfront.net/pimage/2925a20c743423a12f1be4f348f0013f.jpeg",
      status: FALSE,
      inventory: 500
    )

  end

  it "should show a list of all items that belong to a given merchant" do

    visit "/merchants/#{@merchant_1.id}/items"

    expect(page).to have_content(@merchant_1.name)
    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_1.price)
    expect(page).to have_css("img[src*='#{@item_1.image}']")
    expect(page).to have_content(@item_1.status)
    expect(page).to have_content(@item_1.inventory)
    expect(page).to have_content(@item_2.name)
    expect(page).to have_content(@item_2.price)
    expect(page).to have_css("img[src*='#{@item_2.image}']")
    expect(page).to have_content(@item_2.status)
    expect(page).to have_content(@item_2.inventory)
  end

  it "should show a link to add a new item that belongs to a given merchant" do
    visit "/merchants/#{@merchant_1.id}/items"

    expect(page).to have_link("Add New Item")

    click_on "Add New Item"

    expect(current_path).to eq("/merchants/#{@merchant_1.id}/items/new")

    new_item = {
      name: "Cotton Candy Grapes",
      price: 10.00,
      description: "Sourced from USA, Mexico, Chile, Peru, Spain, Brazil, South Africa or Egypt.",
      image: "https://d2lnr5mha7bycj.cloudfront.net/product-image/file/large_0937cb0f-8ded-4275-8afa-c0e89957e1d2.jpg",
      inventory: 300
    }

    fill_in :name, with: new_item[:name]
    fill_in :price, with: new_item[:price]
    fill_in :description, with: new_item[:description]
    fill_in :image, with: new_item[:image]
    fill_in :inventory, with: new_item[:inventory]

    click_on "Create New Item"

    expect(current_path).to eq("/merchants/#{@merchant_1.id}/items")
    expect(page).to have_content(new_item[:name])
    expect(page).to have_content(new_item[:price])
    expect(page).to have_content(new_item[:description])
    expect(page).to have_css("img[src*='#{new_item[:image]}']")
    expect(page).to have_content(new_item[:inventory])
  end
end
