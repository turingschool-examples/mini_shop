require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit the merchant show page" do
    describe "I click a link to delete a merchant" do
      describe "Then a 'DELETE' request is sent to '/merchants/:id' and the merchant is deleted," do
        it "and I am redirected to the merchant index page where I no longer see this merchant" do
          merchant_1 = Merchant.create!(name: 'bobs burgers', address: '123 burger lane', city: 'burger city', state: 'burgerana', zipcode: 12345)

          visit "/merchants/#{merchant_1.id}"
          click_button "Delete"

          # visit "/merchants"

          expect(current_path).to eq('/merchants')
          expect(page).to_not have_content(merchant_1.name)
          expect(page).to_not have_button('Delete')
        end
      end
    end
  end
end
