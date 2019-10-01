require 'rails_helper'

RSpec.describe "merchants show page", type: :feature do

  it "can see name address city state zip" do
    merchant_1 = Merchant.create(name: 'Lisa Payne',
                                 address: '1265 N Elm Street',
                                 city: 'Cherryville',
                                 state: 'NC',
                                 zip: '41942')

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content("Address: #{merchant_1.address}")
    expect(page).to have_content("City: #{merchant_1.city}")
    expect(page).to have_content("State: #{merchant_1.state}")
    expect(page).to have_content("Zip Code: #{merchant_1.zip}")
  end

end
