require 'rails_helper'

describe "merchant delete page", type: :feature do
  before :each do
    @merchant = Merchant.create( name: "Chesters Collectables",
                                  address: "123 Fake St",
                                  city: "Awesomeville",
                                  state: "Montana",
                                  zip: 59001,
    )
  end

  it "can delete a merchant" do
    visit "/merchants/#{@merchant.id}"
    click_link('DELETE')
  end

end
