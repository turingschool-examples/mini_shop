require 'rails_helper'

RSpec.describe 'Merchant Show Page', type: :feature do

  before(:each) do
    @merchant_1 = Merchant.create(name:"scott", address:"4942 willow", city:"denver", state: "co", zip:"90210")
    @merchant_2 = Merchant.create(name:"david", address:"4942 willow", city:"denver", state: "co", zip:"90210")
    @merchant_3 = Merchant.create(name:"ryan", address:"4942 willow", city:"denver", state: "co", zip:"90210")
  end

  it 'shows all merchant info' do
    visit '/merchants/:id'

    expect(page).to have_content(@merchant_1.name)
    expect(page).to have_content(@merchant_1.address)
    expect(page).to have_content(@merchant_1.city)
    expect(page).to have_content(@merchant_1.state)
    expect(page).to have_content(@merchant_1.zip)
  end
end
