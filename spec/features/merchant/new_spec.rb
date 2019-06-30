require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I click a link to create a new merchant' do
    describe "Then I am taken to '/merchants/new' where I  see a form for a new merchant" do
      describe "When I fill out the form with a new merchant's: name, address, city, state, zip" do
        describe 'And I click the button to submit the form' do
          describe "Then a `POST` request is sent to '/merchants'," do
            it 'a new merchant is created and I am redirected to the Merchant Index page where I see the new Merchant listed.' do
            merchant_1 = Merchant.create!(name: 'bobs burgers', address: '123 burger lane', city: 'burger city', state: 'burgerana', zipcode: 12345)

            visit '/merchants'
            click_link "Create a new merchant!"

            fill_in "Name", with: "bobs burgers"
            fill_in "Address", with: '123 burger lane'
            fill_in "City", with: 'burger city'
            fill_in "State", with: 'burgerana'
            fill_in "Zipcode", with: 12345
            click_on "Create Merchant"

            visit "/merchants"

            expect(current_path).to eq("/merchants")
            expect(page).to have_content("bobs burgers")
            end
          end
        end
      end
    end
  end
end
