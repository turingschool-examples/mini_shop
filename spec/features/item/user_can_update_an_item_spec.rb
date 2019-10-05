require 'rails_helper'

RSpec.describe "A a visitor" do
  describe "When I click the item update link on an item show page" do
    it "I can fill out a form to update the item's information" do

      merchant_1 = Merchant.create(name: "Sam's Sports")
      item_1 = Item.create( name: "Basketball",
                            description: "Regulation size basketball",
                            price: 12.99,
                            image: "image path",
                            active: true,
                            inventory:15,
                            merchant_id: merchant_1.id
                          )
    visit "/items/#{item_1.id}"

    click_link 'Edit item'

    expect(current_path).to eq("/items/#{item_1.id}/edit")

    fill_in :name, with: 'Spalding Basketball'
    fill_in :price, with: '15.99'
    fill_in :description, with: 'Brand name basektball'
    fill_in :image, with: 'new image path'
    fill_in :inventory, with: 37
    click_on 'Update Item'

    expect(current_path).to eq("/items/#{item_1.id}")
    expect(page).to have_content('Spalding Basketball')
    expect(page).to have_content(15.99)
    expect(page).to have_content('Brand name basektball')
    expect(page).to have_content('new image path')
    expect(page).to have_content(37)
    end
  end
end
