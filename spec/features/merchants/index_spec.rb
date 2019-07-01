require 'rails_helper'

RSpec.describe "Merchants Index" do
  describe "As a visitor" do
    before(:each) do
      @merchant_1 = Merchant.create(
        name: "Knees Weak",
        address: "1 Oppurtunity Way",
        city: "Denver",
        state: "Colorado",
        zip: 80229
      )

      @merchant_2 = Merchant.create(
        name: "Mom's Spaghetti",
        address: "1 Moment Way",
        city: "Las Vegas",
        state: "Nevada",
        zip: 80003
      )
    end

    it "I see the name of each merchant in the system" do

      visit "/merchants"

      expect(page).to have_content(@merchant_1.name)
      expect(page).to have_content(@merchant_2.name)
    end

    it "I can go to the new merchant page" do

      visit merchants_path

      expect(page).to have_link('New')

      click_link 'New'

      expect(current_path).to eq(new_merchant_path)
    end

    it "I can go to Items Index" do

      visit merchants_path

      expect(page).to have_link('Items')

      click_link 'Items'

      expect(current_path).to eq(items_path)
    end

    it "I can click on the names and go to their show page" do

      visit merchants_path

      expect(page).to have_link(@merchant_1.name)

      click_link @merchant_1.name

      expect(current_path).to eq(merchant_path(@merchant_1))
    end
  end
end
