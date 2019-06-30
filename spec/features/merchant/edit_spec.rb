require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I click a link to update the merchant' do
    it "Then I am taken to '/merchants/:id/edit' where I  see a form to edit the merchant's data including: name, address, city, state, zip" do
    merchant_1 = Merchant.create!(name: 'bobs burgers', address: '123 burger lane', city: 'burger city', state: 'burgerana', zipcode: 12345)

    visit "/merchants/#{merchant_1.id}"
    click_button 'Edit'

    fill_in "Name", with: "bobs burgers"
    fill_in "Address", with: '123 burger lane'
    fill_in "City", with: 'burger city'
    fill_in "State", with: 'burgerana'
    fill_in "Zipcode", with: 12345
    click_on "Submit"

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_content("bobs burgers")
    expect(page).to have_content("123 burger lane")
    expect(page).to have_content("burger city")
    expect(page).to have_content("burgerana")
    expect(page).to have_content(12345)
    end
  end
end
