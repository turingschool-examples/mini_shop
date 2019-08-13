require "rails_helper"

RSpec.describe "Merchant Index Page", type: :feature do
  describe 'As a visitor' do
    it "When I visit '/merchants', I see the name of each merchant in the system" do
      visit merchants_path
      expect(page).to have_content("Meg")
      expect(page).to have_content("Brian")
      expect(page).to have_content("Kelly")
    end
  end
end
