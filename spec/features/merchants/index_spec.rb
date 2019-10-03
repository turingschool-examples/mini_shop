require 'rails_helper'

RSpec.describe "merchant index page", type: :feature do
  describe "As a user" do
    before :each do
      @book_shop = Merchant.create(name: "Flourish and Blotts", address: "123 Diagon Alley", city: "London", state: "UK", zip: 25126)
      @wand_shop = Merchant.create(name: "Ollivanders", address: "125 Diagon Alley", city: "London", state: "UK", zip: 25126)
    end

    it "User can see all merchant names in the system" do
      visit "/merchants"

      expect(page).to have_content("#{@book_shop.name}")
      expect(page).to have_content("#{@wand_shop.name}")
    end
  end
end
