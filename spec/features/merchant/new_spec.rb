require 'rails_helper'

# As a visitor
# When I visit the Merchant Index page
# Then I see a link to create a new merchant
# When I click this link
# Then I am taken to '/merchants/new' where I  see a form for a new merchant
# When I fill out the form with a new merchant's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button to submit the form
# Then a `POST` request is sent to '/merchants',
# a new merchant is created,
# and I am redirected to the Merchant Index page where I see the new Merchant listed.

RSpec.describe 'As a visitor' do
  describe 'When I visit the Merchant Index page' do
    describe "Then I see a link to create a new merchant" do
      describe 'When I click this link' do
        describe "Then I am taken to '/merchants/new' where I  see a form for a new merchant" do
          describe "When I fill out the form with a new merchant's: name, address, city, state, zip" do
            describe 'And I click the button to submit the form' do
              describe "Then a `POST` request is sent to '/merchants'," do
                it 'a new merchant is created and I am redirected to the Merchant Index page where I see the new Merchant listed.' do
                merchant_1 = Merchant.create!(name: 'bobs burgers', address: '123 burger lane', city: 'burger city', state: 'burgerana', zipcode: 12345)

                visit '/merchants'
                click_link '/merchants/new'

                fill_in "merchant[name]", with: "bobs burgers"
                fill_in "merchant[address]", with: '123 burger lane'
                fill_in "merchant[city]", with: 'burger city'
                fill_in "merchant[state]", with: 'burgerana'
                fill_in "merchant[zipcode]", with: 12345
                click_on "Submit"

                visit "/merchants/#{merchant_1.id}"

                expect(page).to have_content("bobs burgers")
                expect(page).to have_content('123 burger lane')
                expect(page).to have_content("burger city")
                expect(page).to have_content('burgerana')
                expect(page).to have_content(12345)

                end
              end
            end
          end
        end
      end
    end
  end
end
