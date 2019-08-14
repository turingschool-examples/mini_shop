require 'rails_helper'

describe 'Merchant Show Page', type: :feature do
  before :each do
    @merchant = Merchant.create(name: 'Some Store', address: '123 Merchant Lane', city: 'Spend City', state: 'NY', zip: 00011)
  end

  it 'should show merchant with address' do
    visit "/merchants/#{@merchant.id}"

    expect(page).to have_content(@merchant.name)
    expect(page).to have_content(@merchant.address)
    expect(page).to have_content(@merchant.city)
    expect(page).to have_content(@merchant.state)
    expect(page).to have_content(@merchant.zip)
  end
end
