require 'rails_helper'

RSpec.describe 'From merchant show page', type: :feature do
  it 'user can update merchant' do
    merchant = Merchant.create(name: "Sedona", address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80218)

    visit "/merchants/#{merchant.id}"

    click_link 'Edit'

    expect(current_path).to eq("/merchants/#{merchant.id}/edit")

    fill_in 'Name', with: 'Funtime Fitness'
    fill_in 'Address', with: '908 Surrells'
    fill_in 'City', with: 'San Antonio'
    fill_in 'State', with: 'TX'
    fill_in 'Zip', with: 78240

    click_on 'Update Merchant'

    expect(current_path).to eq("/merchants/#{merchant.id}")
    expect(page).to have_content('Funtime Fitness')
    expect(page).to have_content('908 Surrells')
    expect(page).to have_content('San Antonio')
    expect(page).to have_content('TX')
    expect(page).to have_content('78240')
    expect(page).to_not have_content('Sedona')
  end
end
