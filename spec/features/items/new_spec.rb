require 'rails_helper'

RSpec.describe "Creating New Items" do
  describe "When I visit a Merchant Items Index page" do
    describe "Then I see a link to create a new item" do
      it "I am rerouted to a form that creates a new item" do

        merchant = Merchant.create!(name: "She Sells Seashells", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")

        visit "/merchants/#{merchant.id}/items"

        click_link "Create New Item"

        expect(current_path).to eq("/merchants/#{merchant.id}/items/new")

        fill_in :name, with: "Wine" #"song[title]"
        fill_in :price, with: 35
        fill_in :description, with: "Petite Sirah"
        fill_in :image, with: "link_to_image"
        fill_in :inventory, with: 4

        click_on "Create Item"

        new_item = Item.last

        expect(current_path).to eq("/merchants/#{merchant.id}/items")

        expect(page).to have_content(new_item.name)
        expect(page).to have_content(new_item.price)
        expect(page).to have_content(new_item.image)
        expect(page).to have_content(new_item.active_status)
        expect(page).to have_content(new_item.inventory)
      end
    end
  end
end
