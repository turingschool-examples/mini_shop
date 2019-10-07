require 'rails_helper'

RSpec.describe "merchant create page" do
  describe "As a user" do
    describe "when I visit the new merchant form by clicking on a link from merchants index page" do
      it "creates a new merchant" do
        visit '/merchants'

        click_link 'New Merchant'

        expect(current_path).to eq('/merchants/new')

        fill_in :name, with: "Broomstix"
        fill_in :address, with: "583 Diagon Alley"
        fill_in :city, with: "London"
        fill_in :state, with: "UK"
        fill_in :zip, with: 25126
        click_on 'Create Merchant'

        expect(current_path).to eq('/merchants')
        expect(page).to have_content('Broomstix')
      end
    end
  end
end
