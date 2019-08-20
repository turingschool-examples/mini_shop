require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the merchants show page' do
    before(:each) do
      @merchant_1 = Merchant.create!(name: "Cecilia Chapman", address: "711-2880 Nulla St.", city: "Mankato", state: "MS", zip: 96522)

      visit "/merchants/#{@merchant_1.id}"
    end

    it "I see the form with prepopulated fields" do
      expect(page).to have_link("Edit")

      click_link 'Edit'

      expect(current_path).to eq("/merchants/#{@merchant_1.id}/edit")
      expect(find_field('Name').value).to eq("Cecilia Chapman")
      expect(find_field('Address').value).to eq("711-2880 Nulla St.")
      expect(find_field('City').value).to eq("Mankato")
      expect(find_field('State').value).to eq("MS")
      expect(find_field('Zip').value).to eq("96522")
    end


    it 'I see a link to update a merchant' do
      click_link 'Edit'

      fill_in :name, with: "Mark"
      fill_in :address, with: "4628 E 23rd Ave"
      fill_in :city, with: "Denver"
      fill_in :state, with: "CO"
      fill_in :zip, with: 80207

      click_button 'Update Merchant'

      expect(current_path).to eq("/merchants/#{@merchant_1.id}")
      expect(page).to have_content("Mark")
      expect(page).to_not have_content("Cecilia Chapman")
      expect(page).to have_content("4628 E 23rd Ave")
      expect(page).to_not have_content("711-2880 Nulla St.")
      expect(page).to have_content("Denver")
      expect(page).to_not have_content("Mankato")
      expect(page).to have_content("CO")
      expect(page).to_not have_content("MS")
      expect(page).to have_content(80207)
      expect(page).to_not have_content(96522)
    end
  end
end
