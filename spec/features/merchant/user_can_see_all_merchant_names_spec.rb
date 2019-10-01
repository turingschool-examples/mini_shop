require 'rails_helper'

RSpec.describe 'Merchant Name Index', type: :feature do
  it 'can see all merchant names' do
    merchant_1 = Merchant.create(
      name: 'Costco'
    )
    merchant_2 = Merchant.create(
      name: 'Sams Club'
    )
    visit '/merchants'
    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end
