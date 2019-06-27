
require "rails_helper"

  RSpec.describe "click name of Merchant and be sent to it's show", type: :feature do

    it "Merchants Index" do

      merch_1 = Merchant.create(name: "Billy", address: "123 Ya moms house Circle", city: "Chicago",
        state: "Illinois", zip: 78047)
      merch_2 = Merchant.create(name: "Mr. Guy", address: "1 big ole' Drive", city: "Honolulu",
        state: "Hawaii", zip: 11111)
      merch_3 = Merchant.create(name: "Penny Pinchin' Paul", address: "345 10th St", city: "Denver",
        state: "Colorado", zip: 80204)
      merch_4 = Merchant.create(name: "Money Mike", address: "$$ Money Drive", city: "Cashville",
        state: "New York", zip: 90876)

        visit "/merchants"


        click_link "Billy"

        expect(current_path).to eq("/merchants/#{merch_1.id}")

    end

  end
