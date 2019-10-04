require 'rails_helper'

RSpec.describe "To delete a merchant" do
  describe "as a visitor" do
    describe "on a merchant show page I click on a delete link to delete
              a merchant" do
      it "a 'DELETE' request is sent to '/merchants/:id' and I am redirected
          to the merchant index page where I no longer see the merchant" do
                # As a visitor
                # When I visit a merchant show page
                # Then I see a link to delete the merchant
                # When I click the link
        merchant_1 = Merchant.create( name: "Corner Store",
                                      address: "234 Yarp Dr.",
                                      city: "Denver",
                                      state: "CO",
                                      zip: "80211")


        visit "/merchants/#{merchant_1.id}"

        expect(page).to have_button("Delete Merchant")

        click_on "Delete Merchant"
        # Then a 'DELETE' request is sent to '/merchants/:id',
        # the merchant is deleted,
        expect(current_path).to eq('/merchants')
        expect(page).to_not have_content(merchant_1.name)
        # and I am redirected to the merchant index page where I no longer see this merchant
      end
    end
  end
end
