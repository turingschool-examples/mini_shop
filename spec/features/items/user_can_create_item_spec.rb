require 'rails_helper'

RSpec.describe "create items", type: :feature do
  it "can create new item link" do
    merchant_1 = Merchant.create(name: "Zac's shop",
                                  address: "1234 Broadway St",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip: "80203")

    visit "/merchants/#{merchant_1.id}/items"

    expect(page).to have_link("Create New Item")

    click_link "Create New Item"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/items/new")
  end

  it "can create new item" do
    merchant_1 = Merchant.create(name: "Zac's shop",
                                  address: "1234 Broadway St",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip: "80203")

    visit "/merchants/#{merchant_1.id}/items/new"

    fill_in 'Name', with: "Cheese Pizza"
    fill_in 'Description', with: "The cheesiest of pizzas"
    fill_in 'Price', with: 16.99
    fill_in 'Image', with: "https://www.averiecooks.com/wp-content/uploads/2018/04/pizza-9.jpg"
    fill_in 'Inventory', with: 20

    click_button 'Submit'

    expect(current_path).to eq("/merchants/#{merchant_1.id}/items")

    expect(page).to have_content("Cheese Pizza")
    expect(page).to have_content("The cheesiest of pizzas")
    expect(page).to have_content(16.99)
    expect(page).to have_css("img[src*='pizza-9.jpg']")
    expect(page).to have_content(20)
    expect(page).to have_content("active")
  end
end
