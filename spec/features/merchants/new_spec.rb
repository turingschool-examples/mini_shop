require 'rails_helper'

RSpec.describe 'merchants index page', type: :feature do
  it 'user can create new merchant' do
    visit '/merchants'

    click_link 'New Merchant'

    expect(current_path).to eq('/merchants/new')

    fill_in 'Name', with: 'Super Seller'
    fill_in 'Address', with: '128 Humboldt'
    fill_in 'City', with: 'Denver'
    fill_in 'State', with: 'CO'
    fill_in 'Zip', with: 80218

    click_on 'Create Merchant'

    expect(current_path).to eq('/merchants')
    expect(page).to have_content('Super Seller')
    expect(page).not_to have_content('128 Humboldt')
  end
end
