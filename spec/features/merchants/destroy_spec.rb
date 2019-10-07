require 'rails_helper'

RSpec.describe "merchant delete page" do
  describe "As a user" do
    describe "when I visit a merchant show page and see link to delete the merchant" do
      it "I can delete the merchant by clicking the link" do
        wand_shop = Merchant.create(name: "Ollivanders", address: "125 Diagon Alley", city: "London", state: "UK", zip: 25126)

        visit "/merchants/#{wand_shop.id}"
        click_on "Delete Merchant"

        expect(current_path).to eq("/merchants")
        expect(page).to_not have_content(wand_shop.name)
      end
    end
  end
end
