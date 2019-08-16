require 'rails_helper'

describe "Item Creation Page" do
  it "has a form to fill in with item information" do
    merchant_2 = Merchant.create!(name: "Gridiron Gear", address: "456 East Drive", city: "Longmont", state: "CO", zip: 80501)

    visit "/merchants/#{merchant_2.id}/items/new"

    expect(page).to have_content("Item name:")
    expect(page).to have_content("Item description:")
    expect(page).to have_content("Item price:")
    expect(page).to have_content("Item image link:")
    expect(page).to have_content("Item status:")
    expect(page).to have_content("Item inventory:")

    fill_in :name, with: "Test name"
    fill_in :description, with: "Test description"
    fill_in :price, with: 123
    fill_in :image, with: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjpk5PY-IXkAhWDrZ4KHckSAHUQjRx6BAgBEAQ&url=http%3A%2F%2Ftestcreative.co.uk%2F&psig=AOvVaw3ubvA6c5cMhxXeXiEvzELG&ust=1565995148137904"
    fill_in :status, with: "active"
    fill_in :inventory, with: 456

    click_button "Submit"

    expect(current_path).to eq("/merchants/#{merchant_2.id}/items")

    expect(page).to have_content("Test name")
    expect(page).to have_content("Test description")
    expect(page).to have_content(123)
    expect(page).to have_xpath("//img[@src='https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjpk5PY-IXkAhWDrZ4KHckSAHUQjRx6BAgBEAQ&url=http%3A%2F%2Ftestcreative.co.uk%2F&psig=AOvVaw3ubvA6c5cMhxXeXiEvzELG&ust=1565995148137904']")
    expect(page).to have_content("active")
    expect(page).to have_content(456)
  end
end
