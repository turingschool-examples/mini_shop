require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'I can delete a merchant' do
    merchant_5 = Merchant.create(name: "Plants", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")

    visit merchant_path(merchant_5)

    click_link 'Delete Merchant'

    expect(current_path).to eq('/merchants')
    expect(page).to_not have_content(merchant_5.name)
    expect(page).to_not have_button('Delete Merchant')
  end
end
