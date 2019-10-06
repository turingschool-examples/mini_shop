require 'rails_helper'

RSpec.describe 'Merchant Show Page', type: :feature do

  before(:each) do
    @merchant_1 = Merchant.create(name:"scott", address:"4942 willow", city:"denver", state: "co", zip:"90210")
  end

  it 'shows all merchant info' do
    # visit '/merchants/:id'
    # visit '/merchants/#{merchant.id}'
    visit "/merchants/#{@merchant_1.id}"

    expect(page).to have_content(@merchant_1.name)
    expect(page).to have_content("Address: #{@merchant_1.address}")
    expect(page).to have_content("City: #{@merchant_1.city}")
    expect(page).to have_content("State: #{@merchant_1.state}")
    expect(page).to have_content("Zip Code: #{@merchant_1.zip}")

  end

end
