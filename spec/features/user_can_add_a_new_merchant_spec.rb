require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I see a link to create a merchant on the index page" do
    describe "When I click this link" do
      it "I am taken to a form to create a new merchant" do
        visit '/merchants'

        click_link 'New Merchant'

        expect(current_path).to eq('/merchants/new')

        fill_in :name, with: 'Merch 1'
        fill_in :address, with: '123 Commerce Street'
        fill_in :city, with: 'Denver'
        fill_in :state, with: 'CO'
        fill_in :zip, with: '80202'
        click_on 'Create Merchant'

        expect(current_path).to eq('/merchants')
        expect(page).to have_content('Merch 1')
      end
    end
  end
end
