require 'rails_helper'

RSpec.describe "Merchants Show" do
  describe "As a visitor" do
    it "I see the merchant with that ID and their info" do
      merchant = Merchant.create(name: "Carl's Cyclery", address: "123 Puma Drive", city: "Denver", state: "CO", zip: "80210")

      visit "/merchants/#{merchant.id}"

      expect(page).to have_content(merchant.name)
      expect(page).to have_content(merchant.address)
      expect(page).to have_content(merchant.city)
      expect(page).to have_content(merchant.state)
      expect(page).to have_content(merchant.zip)
    end
  it "I see a link to edit merchant info and the forms are prepopulated with current info" do
      merchant = Merchant.create(name: "Carl's Cyclery", address: "123 Puma Drive", city: "Denver", state: "CO", zip: "80210")

      visit "/merchants/#{merchant.id}"
      click_on 'Update Info'

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")

      expect(find_field('Name').value).to eq "Carl's Cyclery"
      expect(find_field('Address').value).to eq "123 Puma Drive"
      expect(find_field('City').value).to eq "Denver"
      expect(find_field('State').value).to eq "CO"
      expect(find_field('Zip').value).to eq "80210"

      fill_in 'Name', with: "Bob's Cyclery"
      click_on 'Submit'

      expect(current_path).to eq("/merchants/#{merchant.id}")
      expect(page).to have_content("Bob's Cyclery")
    end
  end
end
