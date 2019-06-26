
require "rails_helper"

  RSpec.describe "merchants show page", type: :feature do

    it "user can Delete a merchants info" do

      merch_1 = Merchant.create(name: "Billy", address: "123 Ya moms house Circle", city: "Chicago",
        state: "Illinois", zip: 78047)
      merch_2 = Merchant.create(name: "Mr. Guy", address: "1 big ole' Drive", city: "Honolulu",
        state: "Hawaii", zip: 11111)
      merch_3 = Merchant.create(name: "Penny Pinchin' Paul", address: "345 10th St", city: "Denver",
        state: "Colorado", zip: 80204)
      merch_4 = Merchant.create(name: "Money Mike", address: "$$ Money Drive", city: "Cashville",
        state: "New York", zip: 90876)

        visit "/merchants/#{merch_3.id}"



        click_link "Delete Merchant"

        expect(current_path).to eq("/merchants")


        expect(page).to_not have_content(merch_3.name)
        expect(page).to_not have_content(merch_3.address)
        expect(page).to_not have_content(merch_3.city)
        expect(page).to_not have_content(merch_3.state)
        expect(page).to_not have_content(merch_3.zip)


    end

  end


# User Story 5, Merchant Delete
#
# As a visitor
# When I visit a merchant show page
# Then I see a link to delete the merchant
# When I click the link
# Then a 'DELETE' request is sent to '/merchants/:id',
# the merchant is deleted,
# and I am redirected to the merchant index page where I no longer see this merchant
