require 'rails_helper'

describe 'merchants index page' do
  it 'should show list of all merchants' do
    merchant_1 = Merchant.create( name: 'Bob Ross Paints',
                                  address: '2345 Happy Tree Place',
                                  city: 'Boulder',
                                  state: 'CO',
                                  zip: '80303')
    merchant_2 = Merchant.create( name: 'Yum Yum Snacks',
                                  address: '123 Tasty Town Ave',
                                  city: 'Denver',
                                  state: 'CO',
                                  zip: '80239')

    visit '/merchants'

    expect(page).to have_link('Bob Ross Paints')
    expect(page).to have_link('Yum Yum Snacks')
    expect(page).to have_link('Add Merchant')

    visit '/merchants?sort=a-z'
    
  end
end
