require 'rails_helper'

RSpec.describe "To delete a merchant" do
  describe "as a visitor" do
    describe "on a merchant show page I click on a delete link to delete
              a merchant" do
      it "a 'DELETE' request is sent to '/merchants/:id' and I am redirected
          to the merchant index page where I no longer see the merchant" do

        merchant_1 = Merchant.create( name: "Corner Store",
                                      address: "234 Yarp Dr.",
                                      city: "Denver",
                                      state: "CO",
                                      zip: "80211")

        visit "/merchants/#{merchant_1.id}"

        click_on "Delete Merchant"

        expect(current_path).to eq('/merchants')
        expect(page).to_not have_content(merchant_1.name)
      end
    end
  end
end
