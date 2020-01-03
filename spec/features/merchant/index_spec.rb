require 'rails_helper'

describe "As a vistior" do
    describe "when I visit '/merchants'" do
      it "Can see the name of each merchant" do
        apple_nyc = Merchant.create!(name: "Apple NYC", address: "123 Bear st.", city: "Denver", state: "CO", zip: "80220")

        visit '/merchants'
        expect(page).to have_content(apple_nyc.name)
    end
  end
end
