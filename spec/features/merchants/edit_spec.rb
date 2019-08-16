require 'rails_helper'

describe 'Merchant Edit Page' do
  before :each do
    @merchant = Merchant.create(name: 'Dry Goods Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80021)
  end

  it 'edits existing merchant and updates Merchant Show page' do
    visit "/merchants/#{@merchant.id}/edit"
    expect(current_path).to eq("/merchants/#{@merchant.id}/edit")

    fill_in :name, with: 'Applience Outlet'
    fill_in :address, with: '159 County Road'
    fill_in :city, with: 'Denver'
    fill_in :state, with: 'CO'
    fill_in :zip, with: '80001'

    click_on 'Update Merchant'

    expect(current_path).to eq("/merchants/#{@merchant.id}")
    expect(page).to have_content('Applience Outlet')
  end
end
