require 'rails_helper'

describe 'Merchant Show Page' do
  before :each do
    @merchant_3 = Merchant.create(name: 'Dry Goods Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80021)
  end

  it 'should show merchant name, address, city, state, zip' do
    visit "/merchants/#{@merchant_3.id}"

    expect(page).to have_content(@merchant_3.name)
    expect(page).to have_content(@merchant_3.address)
    expect(page).to have_content(@merchant_3.city)
    expect(page).to have_content(@merchant_3.state)
    expect(page).to have_content(@merchant_3.zip)
  end
end
