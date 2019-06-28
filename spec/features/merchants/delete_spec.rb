require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'When I visit a merchant show page I see a link to delete a Merchant' do

    merchant_1 = Merchant.create(name: "Thai Tanic", address: "12600 Feet Under the Sea", city: "North Atlantic Ocean", state: "SOS", zip: 1912)

    visit "/merchants/#{merchant_1.id}"

    click_link 'Delete Merchant'

    expect(current_path).to eq("/merchants")

    expect(page).to_not have_content(merchant_1.name)
    expect(page).to_not have_content(merchant_1.address)
    expect(page).to_not have_content(merchant_1.city)
    expect(page).to_not have_content(merchant_1.state)
    expect(page).to_not have_content(merchant_1.zip)
  end
end
