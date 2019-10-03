require 'rails_helper'

RSpec.describe "merchant show page", type: :feature do
  describe "As a user" do
    before :each do
      @book_shop = Merchant.create(name: "Flourish and Blotts", address: "123 Diagon Alley", city: "London", state: "UK", zip: 25126)
    end

    it "I can see the name, address, city, state, zip of merchant" do
      visit "/merchants/#{@book_shop.id}"

      expect(page).to have_content("Flourish and Blotts")
      expect(page).to have_content("123 Diagon Alley")
      expect(page).to have_content("London")
      expect(page).to have_content("UK")
      expect(page).to have_content(25126)
    end
  end
end
