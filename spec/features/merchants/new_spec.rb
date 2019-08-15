require 'rails_helper'

describe "New Merchant Page" do
  it 'creates a new merchant and returns to Merchant Index page' do
    visit '/merchants/new'
    expect(current_path).to eq("/merchants/new")

    fill_in :name, with: 'New Merchant'
    fill_in :address, with: '135 Main'
    fill_in :city, with: 'Denver'
    fill_in :state, with: 'Colorado'
    fill_in :zip, with: '80023'

    click_on 'Create Merchant'

    expect(current_path).to eq('/merchants')
    expect(page).to have_content('New Merchant')
  end
end
