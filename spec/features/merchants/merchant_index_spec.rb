require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do

  it "can see all merchant names" do
    merchant_1 = Merchant.create(name: 'Lisa Payne',
                                 address: '1265 N Elm Street',
                                 city: 'Cherryville',
                                 state: 'NC',
                                 zip: '41942')
    merchant_2 = Merchant.create(name: 'Phil Connors',
                                 address: '76 Poinsetta Street',
                                 city: 'Johnstown',
                                 state: 'AK',
                                 zip: '94591')

    visit '/merchants'

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end

end
