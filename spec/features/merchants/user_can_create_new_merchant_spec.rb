require "rails_helper"

describe "User creates a new merchant" do
  describe "They link from the merchants index" do
    describe "They fill in all merchant attributes & submit" do
      it "Creates a new merchant & returns to index page" do
        visit '/merchants'
        click_link "Create a New Merchant"

        expect(current_path).to eq('/merchants/new')

        fill_in "merchant[name]", with: "Amazon"
        fill_in "merchant[address]",  with: "678 Greedy Ave"
        fill_in "merchant[city]",  with: "Mountain View"
        fill_in "merchant[state]",  with: "CA"
        fill_in "merchant[zip]",  with: "90003"

        click_on "Create Merchant"

        expect(current_path).to eq('/merchants')
        expect(page).to have_content("Amazon")
      end
    end
  end
end
