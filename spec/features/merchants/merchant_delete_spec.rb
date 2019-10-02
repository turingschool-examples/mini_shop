require 'rails_helper'

# As a visitor
# When I visit a merchant show page
# Then I see a link to delete the merchant
# When I click the link
# Then a 'DELETE' request is sent to '/merchants/:id',
# the merchant is deleted,
# and I am redirected to the merchant index page where I no longer see this merchant

RSpec.describe "merchant delete", type: :feature do

  before :each do
    @merchant = Merchant.create(
      name: 'Back to the Fuscia',
      address: '1862 W Starlight Road',
      city: 'Frankfurt',
      state: 'KY',
      zip: 23671
    )
  end

  it "can see link to delete merchant from show page" do
    visit "/merchants/#{@merchant.id}"

    expect(page).to have_button('Delete Merchant')
  end

  it "can delete merchant by clicking on link" do
    visit "/merchants/#{@merchant.id}"
    click_button 'Delete Merchant'

    expect(current_path).to eq('/merchants')
    expect(page).to have_content(@merchant.name)
  end

end
