require 'rails_helper'

describe 'merchants index page', type: :feature do
  before :each do
    @merchant_1 = Merchant.create!(name: 'Some Store')
  end

  it 'shows all merchants' do
    visit '/merchants'

    expect(page).to have_content(@merchant_1.name)
  end
end
