require 'rails_helper'

RSpec.describe "User edits existing Merchant", type: :feature do
  describe "User goes to Merchant's show page" do
    describe "User clicks on link to update Merchant" do
      describe "User fills out and submits form" do
        it "Changes Merchant based on form" do
          merchant_1 = Merchant.create(name: "Apple",
                                    address: "123 Greedy Ave",
                                       city: "Mountain View",
                                      state: "CA",
                                        zip: 90001)
          merchant_2 = Merchant.create(name: "Google",
                                      address: "456 Greedy Ave",
                                      city: "Mountain View",
                                      state: "CA",
                                      zip: 90002)

          visit "/merchants/#{merchant_1.id}"

          expect(page).to have_content(merchant_1.name)
          expect(page).to have_content(merchant_1.address)
          expect(page).to have_content(merchant_1.city)
          expect(page).to have_content(merchant_1.state)
          expect(page).to have_content(merchant_1.zip)

          click_link "Edit Merchant"

          expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")

          fill_in "merchant[name]", with: "Amazon Hegemony"
          fill_in "merchant[address]",  with: "123 Everywhere ln"
          fill_in "merchant[city]",  with: "San Francisco"
          fill_in "merchant[state]",  with: "CA"
          fill_in "merchant[zip]",  with: "90004"

          click_on "Submit Changes"

          expect(current_path).to eq("/merchants/#{merchant_1.id}")
          expect(page).to have_content("Amazon Hegemony")
          expect(page).to have_content("123 Everywhere ln")
          expect(page).to have_content("San Francisco")
          expect(page).to have_content("CA")
          expect(page).to have_content("90004")

          expect(page).to_not have_content(merchant_2.name)
          expect(page).to_not have_content(merchant_2.address)
          expect(page).to_not have_content(merchant_2.city)
          expect(page).to_not have_content(merchant_2.zip)

        end
      end
    end
  end
end
