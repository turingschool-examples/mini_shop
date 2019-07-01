require "rails_helper"

RSpec.describe "New Merchant Form/Creation", type: :feature do
  describe "As a visitor" do
    describe "When I visit the new merchant form by clicking a link on the index page" do
      it "I see a form to add a new merchant" do
        visit "/merchants"

        expect(page).to have_link("Add Merchant")

        click_link "Add Merchant"

        expect(current_path).to eq("/merchants/new")

        fill_in "Name", with: "Stella"
        fill_in "Address", with: "123 Summer Lane"
        fill_in "City", with: "Denver"
        fill_in "State", with: "CO"
        fill_in "Zip", with: "54321"

        click_button "Create Merchant"

        new_merchant = Merchant.last

        expect(current_path).to eq("/merchants")
        expect(page).to have_content(new_merchant.name)
      end
    end
  end
end
