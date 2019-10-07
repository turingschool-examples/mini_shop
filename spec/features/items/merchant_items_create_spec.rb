require 'rails_helper'

RSpec.describe "merchant item create page" do
  describe "As a user" do
    describe "when I visit a merchant items index page" do
      it "I can click a link that takes me to a form to create a new item" do
        wand_shop = Merchant.create(name: "Ollivanders", address: "125 Diagon Alley", city: "London", state: "UK", zip: 25126)
        visit "/merchants/#{wand_shop.id}/items/new"

        click_link "Create New Item"

        expect(current_path).to eq("/merchants/#{wand_shop.id}/items/new")

        fill_in :name, with: "Elder Wand"
        fill_in :price, with: 500
        fill_in :description, with: "A wand worthy of one who can outsmart death."
        fill_in :image, with: "https://vignette.wikia.nocookie.net/harrypotter/images/5/59/Elder_Wand.png/revision/latest?cb=20161128051519"
        fill_in :inventory, with: 1

        click_button "Create Item"

        expect(current_path).to eq("/merchants/#{wand_shop.id}/items")
        expect(page).to have_content("Elder Wand")
        expect(page).to have_content("Price: $500")
        expect(page).to have_content("A wand worthy of one who can outsmart death.")
        expect(page).to have_css("img[src*='https://vignette.wikia.nocookie.net/harrypotter/images/5/59/Elder_Wand.png/revision/latest?cb=20161128051519']")
        expect(page).to have_content("Inventory: 1")
      end
    end
  end
end
