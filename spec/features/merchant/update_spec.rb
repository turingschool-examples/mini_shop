require "rails_helper"

RSpec.describe "Merchant Creation", type: :feature do
  before :each do
    @meg = Merchant.create!(name: "Meg", address: "24 Bike Spoke Lane", city: "Denver", state: "CO", zip: "80237")
    @brian = Merchant.create!(name: "Brian", address: "549 Pike Peak Drive", city: "Greenville", state: "SC", zip: "23674")
    @Kelly = Merchant.create!(name: "Kelly", address: "1 Lollipop Lane", city: "Candy Cane", state: "AZ", zip: "11265")
  end
  describe 'As a visitor, when I visit a merchant show page' do
    it "I see a link to update the merchant" do
      visit merchant_path(@meg)
      expect(page).to have_link("Update Merchant")
    end
    it "When I click the link, I am taken to '/merchants/:id/edit' where I  see a prepopulated form to edit the merchant's data" do
      visit merchant_path(@meg)

      click_link "Update Merchant"
      expect(current_path).to eq(merchant_update_path)

      expect(page).to have_content("Edit Merchant Form")
      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("City")
      expect(page).to have_content("State")
      expect(page).to have_content("Zip")

      expect(page).to have_content("Meg")
      expect(page).to have_content("24 Bike Spoke Lane")
      expect(page).to have_content("Denver")
      expect(page).to have_content("CO")
      expect(page).to have_content("80237")
    end
    it "When I fill out the form with updated information, and click the button
        to submit the form, the merchant's info is updated, and I am redirected
        to the Merchant's Show page where I see the merchant's updated info" do
      visit merchant_path(@meg)
      click_link "Update Merchant"

      fill_in "Name", with: "Allison"
      fill_in "Address", with: "Gator Ave"
      fill_in "City", with: "Chomp City"
      fill_in "State", with: "FL"
      fill_in "Zip", with: 34109

      click_button "Submit"
      expect(current_path).to eq(merchant_path(@meg))

      expect(page).to have_content("Allison")
      expect(page).to have_content("Gator Ave")
      expect(page).to have_content("Chomp City")
      expect(page).to have_content("FL")
      expect(page).to have_content("34109")

      expect(page).to_not have_content("Meg")
      expect(page).to_not have_content("24 Bike Spoke Lane")
      expect(page).to_not have_content("Denver")
      expect(page).to_not have_content("CO")
      expect(page).to_not have_content("80237")

      expect(page).to_not have_content(@brian.name)
      expect(page).to_not have_content(@brian.address)
      expect(page).to_not have_content(@brian.city)
      expect(page).to_not have_content(@brian.state)
      expect(page).to_not have_content(@brian.zip)

      expect(page).to_not have_content(@kelly.name)
      expect(page).to_not have_content(@kelly.address)
      expect(page).to_not have_content(@kelly.city)
      expect(page).to_not have_content(@kelly.state)
      expect(page).to_not have_content(@kelly.zip)
    end
  end
end
