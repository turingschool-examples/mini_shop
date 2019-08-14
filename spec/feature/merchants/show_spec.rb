require "rails_helper"

RSpec.describe 'As a visitor' do
  describe 'I visit a merchants show page' do
    it "then I see only that merchants general information" do

            merchant_1 = Merchant.create(name: "Merchant 1")
            merchant_2 = Merchant.create(name: "Merchant 2")

       visit "/merchants/#{@merchant_1.id}"

         expect(page).to have_content(@merchant_1.name)
         expect(page).to have_content(@merchant_1.address)
         expect(page).to have_content(@merchant_1.city)
         expect(page).to have_content(@merchant_1.state)
         expect(page).to have_content(@merchant_1.zip)
    end
  end
end
