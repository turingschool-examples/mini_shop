require 'rails_helper'

describe 'merchants edit', type: :feature do
  it 'can edit a merchant' do
    merchant_1 = Merchant.create(name: "Hills Shop",
                                address: "not cool place",
                                city: "denver",
                                state: "colorado",
                                zip: "80210")

    visit "/merchants/#{merchant_1.id}"

    click_link 'Edit Merchant'

    expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")

    fill_in 'merchant[name]', with: 'Hills Beach Shop'
    fill_in 'merchant[address]', with: '1234 Front Beach Rd.'
    fill_in 'merchant[city]', with: 'Panama City Beach'
    fill_in 'merchant[state]', with: 'Florida'
    fill_in 'merchant[zip]', with: '34534'

    click_button "Update"

    expect(current_path).to eq("/merchants")
    expect(page).to have_content("Hills Beach Shop")
  end
end