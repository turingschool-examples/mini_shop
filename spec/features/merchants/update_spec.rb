# As a visitor
# When I visit a merchant show page
# Then I see a link to update the merchant
# When I click the link
# Then I am taken to '/merchants/:id/edit'
# where I  see a form to edit the merchant's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/merchants/:id',
# the merchant's info is updated,
# and I am redirected to the Merchant's Show page
# where I see the merchant's updated info

require 'rails_helper'

RSpec.describe "Update merchant" do
  describe "as a visitor" do
    describe "when visting merchant show page" do
      it "can update a merchant" do
        merchant = Merchant.create!(name:    "Beenz",
                                    address: "300 West Main Street",
                                    city:    "Avon",
                                    state:   "CT",
                                    zip:     06001)

        visit "/merchants/#{merchant.id}"

        click_link "Update merchant"

        expect(current_path).to eq("/merchants/#{merchant.id}/edit")

        fill_in 'Name', with: 'Cool Beenz'
        fill_in 'Address', with: '300 West Main Street'
        fill_in 'City', with: 'Avon'
        fill_in 'State', with: 'CT'
        fill_in 'Zip', with: '06001'

        click_button 'Update merchant'

        expect(current_path).to eq("/merchants/#{merchant.id}")
        expect(page).to have_content('Cool Beenz')
      end
    end
  end
end
