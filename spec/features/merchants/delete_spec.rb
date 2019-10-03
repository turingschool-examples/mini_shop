require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'I can delete a Merchant' do
    merchant_1 = Merchant.create(name: "REI",
                                 address: "1234 Smith Street",
                                 city: "Boulder",
                                 state: "Colorado",
                                 zip: "80303")

    visit '/merchants'

    click_button 'Delete'

    expect(current_path).to eq('/merchants')
    expect(page).to_not have_content(merchant_1.name)
    expect(page).to_not have_button('Delete')
  end
end