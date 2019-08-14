require 'rails_helper'

RSpec.describe 'merchant index page', type: :feature do
  it 'user can see all merchants by name' do
    merchant_1 = Merchant.create(name: 'Dry Goods Store')
    merchant_2 = Merchant.create(name: 'Home Goods Store')

    visit '/merchants'

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end
