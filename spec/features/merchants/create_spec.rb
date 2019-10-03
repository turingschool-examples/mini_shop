require 'rails_helper'

RSpec.describe "merchant create page" do
  describe "As a user" do
    describe "when I visit the new merchant form by clicking new merchant" do
      it "creates a new merchant" do
        visit '/merchants'

        click_link 'New Merchant'

        expect(current_path).to eq('/merchants/new')

        fill_in 'Merchant', with: "Broomstix"
        click_on 'Create Merchant'

        expect(current_path).to eq('/merchants')
        expect(page).to have_content('Broomstix')
      end
    end
  end
end
