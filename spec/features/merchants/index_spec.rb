require 'rails_helper'

describe "As a visitor" do
  before :each do
    @merchant_1 = Merchant.create(name: "merchant_1", address: "123 Main", city: "Denver", state:"CO", zip:"80204")
    @merchant_2 = Merchant.create(name: "merchant_2", address: "789 Pacific", city: "Lakewood", state:"CO", zip:"80214")
end

  describe "when I visit '/merchants'" do

    it "Then I see the name of each merchant in the system" do
      visit "/merchants"
      expect(page).to have_content(@merchant_1.name)
      expect(page).to have_content(@merchant_2.name)
      expect(page).to have_link("Create New Merchant")
    end

    describe "and I see a link to create a new merchant" do
      describe "when I click the link" do
        it "takes me to '/merchants/new' where I see a form" do
          visit "/merchants"
          click_link "Create New Merchant"

          expect(current_path).to eq("/merchants/new")
        end
      end

    end
  end

end
