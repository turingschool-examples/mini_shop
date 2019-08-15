require 'rails_helper'

describe 'merchant index page' do
  before :each do
    @merchant_1 = Merchant.create(name: 'Dry Goods Store')
    @merchant_2 = Merchant.create(name: 'Home Goods Store')
  end

  it 'user can see all merchants by name' do
    visit '/merchants'

    expect(page).to have_content(@merchant_1.name)
    expect(page).to have_content(@merchant_2.name)
  end
end
