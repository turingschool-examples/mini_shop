require "rails_helper"

RSpec.describe "Merchant Update", type: :feature do
  describe "As a visitor" do
    before(:each) do
      @merchant_1 = Merchant.create!(name: "Merchant 1", address: "Address 1", city: "City 1", state: "State 1", zip: "Zip 1")
    end

    describe "When I click the link 'Edit Merchant Info' on the show page" do
      it "I  see a form to edit the merchant's data" do
        visit "/merchants/#{@merchant_1.id}"
        expect(page).to have_link("Edit Info")
        click_link "Edit Info"
        expect(current_path).to eq("/merchants/#{@merchant_1.id}/edit")
        new_address = "123 sesame st"
        new_city = "denver"
        new_zip = "12345"
        fill_in "Address", with: new_address
        fill_in "City", with: new_city
        fill_in "Zip", with: new_zip
        click_button "Submit Update"
        expect(current_path).to eq("/merchants/#{@merchant_1.id}")
        expect(page).to have_content(new_address)
        expect(page).to have_content(new_city)
        expect(page).to have_content(new_zip)
      end
    end
  end
end
