require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit a merchant's show page" do
    it "I can click a link and delete a merchant" do

      merchant_1 = Merchant.create( name: "First Merch",
                                    address: "123 Commerce Street",
                                    city: 'Denver',
                                    state: 'CO',
                                    zip: '80202'
                                  )

      visit "merchants/#{merchant_1.id}"

      click_link 'Delete Merchant'

      expect(current_path).to eq('/merchants')

      expect(page).to_not have_content(merchant_1.name)
      expect(page).to_not have_content(merchant_1.address)
      expect(page).to_not have_content(merchant_1.city)
      expect(page).to_not have_content(merchant_1.state)
      expect(page).to_not have_content(merchant_1.zip)

    end
  end
end
