require 'rails_helper'

describe 'merchant show page', type: :feature do
  before :each do
    @merchant_1 = Merchant.create!(name: 'Some Store', address: '123 Merchant Lane', city: 'Spend City', state: 'NY', zip: 00011)
  end

  it 'show merchant details' do
    visit "/merchants/#{@merchant_1.id}"

    expect(page).to have_content(@merchant_1.name)
    expect(page).to have_content(@merchant_1.address)
    expect(page).to have_content(@merchant_1.city)
    expect(page).to have_content(@merchant_1.state)
    expect(page).to have_content(@merchant_1.zip)
  end
end
