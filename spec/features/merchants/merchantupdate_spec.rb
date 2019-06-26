require "rails_helper"

  RSpec.describe "merchants show page", type: :feature do

    it "user can update a merchants info" do

      merch_1 = Merchant.create(name: "Billy", address: "123 Ya moms house Circle", city: "Chicago",
        state: "Illinois", zip: 78047)
      merch_2 = Merchant.create(name: "Mr. Guy", address: "1 big ole' Drive", city: "Honolulu",
        state: "Hawaii", zip: 11111)

        visit "/merchants/#{merch_1.id}"
        

        click_on "Update Merchant"

        expect(current_path).to eq("/merchants/#{merch_1.id}/edit")

        fill_in 'Name', with: 'Mr. Guy'
        fill_in 'Address', with: "1 big ole' Drive"
        fill_in 'City', with: 'Honolulu'
        fill_in 'State', with: 'Hawaii'
        fill_in 'Zip', with: '11111'

        click_on "Update Merchant Info"

        expect(current_path).to eq("/merchants/#{merch_1.id}")

        expect(page).to have_content(merch_2.name)
        expect(page).to have_content(merch_2.address)
        expect(page).to have_content(merch_2.city)
        expect(page).to have_content(merch_2.state)
        expect(page).to have_content(merch_2.zip)



    end

  end








# User Story 4, Merchant Update
#
# As a visitor
# When I visit a merchant show page
# Then I see a link to update the merchant
# When I click the link
# Then I am taken to '/merchants/:id/edit' where I  see a form to edit the merchant's data including:
# - name
# - address
# - city
# - state
# - zip
# The form fields are prepopulated with the merchant's current info
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/merchants/:id',
# the merchant's info is updated,
# and I am redirected to the Merchant's Show page where I see the merchant's updated info
