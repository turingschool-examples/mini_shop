require 'rails_helper'

describe "Can view merchant info" do
  it "can click on merchant to show and view" do
    merchant_1 = Merchant.create(
      name: 'Costco',
      address: '123 Main st',
      city: 'Lakewood',
      state: 'CO',
      zip: '80127'
    )
    visit '/merchants'
    expect(page).to have_link('Costco')
    click_link('Costco')
    expect(page).to have_content('Costco')
    expect(page).to have_content('123 Main st')
    expect(page).to have_content('Lakewood')
    expect(page).to have_content('CO')
    expect(page).to have_content('80127')
  end
end
