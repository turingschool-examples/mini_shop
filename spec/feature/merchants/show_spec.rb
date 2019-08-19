require "rails_helper"

RSpec.describe 'As a visitor', type: :feature do
  describe 'I visit a merchants show page' do
    it 'then I see only that merchants general information' do
      merchant_1 = Merchant.create(name: "Merchant 1", address: "address1", city: "city1", state: "state1", zip:"zip1")

      visit "/merchants/#{merchant_1.id}"

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_1.address)
      expect(page).to have_content(merchant_1.city)
      expect(page).to have_content(merchant_1.state)
      expect(page).to have_content(merchant_1.zip)
    end
  end

  describe 'I visit a merchants show page' do

    it "user sees a link to delete the merchant" do
      merchant_2 = Merchant.create(name: "Merchant 2", address: "address2", city: "city2", state: "state2", zip:"zip2")
      visit "/merchants/#{merchant_2.id}"

      expect(page).to have_link("Delete")

      click_link "Delete"

      expect(current_path).to eq("/merchants")
      
      expect(page).to_not have_content(merchant_2.name)
      expect(page).to_not have_content(merchant_2.address)
      expect(page).to_not have_content(merchant_2.city)
      expect(page).to_not have_content(merchant_2.state)
      expect(page).to_not have_content(merchant_2.zip)
    end
  end
end
