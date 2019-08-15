require 'rails_helper'

describe 'User clicks delete button on merchant show page' do
  it 'Destroys record of merchant' do
    merchant_1 = Merchant.create(name: 'Bob Ross Paints',
                                address: '2345 Happy Tree Place',
                                city: 'Boulder',
                                state: 'CO',
                                zip: '80303')
    merchant_2 = Merchant.create( name: 'Yum Yum Snacks',
                                  address: '123 Tasty Town Ave',
                                  city: 'Denver',
                                  state: 'CO',
                                  zip: '80239')

    visit "/merchants/#{merchant_1.id}"
    click_link 'Delete Merchant'

    expect(current_path).to eq('/merchants')
    expect(page).to_not have_content('Bob Ross Paints')
    expect(page).to have_content('Yum Yum Snacks')
  end
end
