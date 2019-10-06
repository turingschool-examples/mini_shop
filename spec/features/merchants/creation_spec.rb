require 'rails_helper'

RSpec.describe 'Merchant Creation Page', type: :feature do

  # before(:each) do
  #   @merchant_1 = Merchant.create(name:"scott", address:"4942 willow", city:"denver", state: "co", zip:"90210")
  # end

  it "can click on new merchant link to create new merchant on index page" do
    visit '/merchants'

    expect(page).to have_link('Create New Merchant')

  end



end
