require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I click on update merchant on the show page" do
    it "I can edit the merchant information form" do
      merchant_1 = Merchant.create( name: "First Merch",
                                    address: "123 Commerce Street",
                                    city: 'Denver',
                                    state: 'CO',
                                    zip: '80202'
                                  )

      visit "merchants/#{merchant_1.id}"

      click_link 'Update Merchant'

      expect(current_path).to eq("/merchants/#{merchant_1.id}/update")

      fill_in :address, with: '123 15th Street'
      fill_in :city, with: 'Boulder'
      fill_in :state, with: 'CO'
      fill_in :zip, with: '80302'
      click_on 'Submit Changes'

      expect(current_path).to eq('/merchants')
      expect(page).to have_content('First Merch')
      expect(page).to have_content('123 15th Street')
      expect(page).to have_content('Boulder')
      expect(page).to have_content('CO')
      expect(page).to have_content('80302')

    end
  end
end
