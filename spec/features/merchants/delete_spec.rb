require 'rails_helper'

RSpec.describe 'From merchant show page', type: :feature do
  it 'user can delete merchant' do
    merchant_1 = Merchant.create(name: "Sedona", address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80218)
    merchant_2 = Merchant.create(name: "Fun Fitness", address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80218)

    visit "/merchants/#{merchant_1.id}"

    click_link 'Delete'

    expect(current_path).to eq("/merchants")

    expect(page).to_not have_link('Sedona')
    expect(page).to have_link('Fun Fitness')
  end
end
