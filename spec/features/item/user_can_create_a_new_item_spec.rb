require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I click the add an item button on a merchant's item page" do
    it "I see a form I can use to create a new item" do

      merchant_1 = Merchant.create(name: "Sam's Sports")

      visit "/merchants/#{merchant_1.id}/items"

      click_on 'Add an item'

      expect(current_path).to eq("/merchants/#{merchant_1.id}/items/new")
    end
  end
end
