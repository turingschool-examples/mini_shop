require 'rails_helper'

describe 'user creates a new merchant' do
  describe 'they link from merchant index' do
    describe 'they fill in name address city state zip' do
      it 'creates a new merchant' do
        visit '/merchants/'
        click_link "New Merchant"

        expect(current_path).to eq(new_merchant_path)

        fill_in "merchant[name]", with: "Bread Pitt"
        fill_in "merchant[address]", with: "2345 Wheat Way"
        fill_in "merchant[city]", with: "Chicago"
        fill_in "merchant[state]", with: "IL"
        fill_in "merchant[zip]", with: "60176"

        click_on "Create Merchant"

        expect(page).to have_link("Bread Pitt")
      end
    end
  end
end
