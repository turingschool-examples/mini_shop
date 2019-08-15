require 'rails_helper'

describe 'Merchant Show Page' do
  before :each do
    @merchant = Merchant.create(name: 'Dry Goods Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80021)
  end

  it 'should show merchant name, address, city, state, zip' do
    visit "/merchants/#{@merchant.id}"

    expect(page).to have_content(@merchant.name)
    expect(page).to have_content(@merchant.address)
    expect(page).to have_content(@merchant.city)
    expect(page).to have_content(@merchant.state)
    expect(page).to have_content(@merchant.zip)
  end

  it 'has a link to edit merchant information' do
    visit "/merchants/#{@merchant.id}"
    click_on 'Edit Merchant'
    expect(current_path).to eq("/merchants/#{@merchant.id}/edit")
  end
end
