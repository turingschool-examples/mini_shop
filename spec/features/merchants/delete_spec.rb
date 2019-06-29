require 'rails_helper'

RSpec.describe "Merchant Delete" do
  describe "As a visitor" do
    describe "When I visit the merchant show page" do
      it "I can delete a merchant" do
        merchant_1 = Merchant.create(
          name: "Knees Weak",
          address: "1 Oppurtunity Way",
          city: "Denver",
          state: "Colorado",
          zip: 80229
        )

        visit "/merchants/#{merchant_1.id}"

        click_link 'Delete'

        expect(current_path).to eq('/merchants')
        expect(page).to_not have_content(merchant_1.name)
      end
    end
  end
end
