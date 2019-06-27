require 'rails_helper'

RSpec.describe 'Update Merchant' do
  describe 'As a visitor' do
    describe 'When I visit the merchants show page' do
      it 'I can update a merchant' do
        merchant_1 = Merchant.create(name: "She Sells Seashells", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")

        visit "/merchants/#{merchant_1.id}"

        click_link 'Update Merchant'

        expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")
      end
    end
  end
end    
#     describe 'When I visit the edit page' do
#       it "The link is prefilled" do
#           merchant_1 = Merchant.create(name: "She Sells Seashells", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")
#
#       visit "/merchants/#{merchant_1.id}/edit"
#     end
#
#         click_on 'Submit Update'
#         # expect(page).to have_content(merchant_1.name)
#         # expect(page).to have_content(merchant_1.address)
#         # expect(page).to have_content(merchant_1.city)
#         # expect(page).to have_content(merchant_1.state)
#         # expect(page).to have_content(merchant_1.zipcode)
#
#         expect(current_path).to eq("/merchants/#{merchant_1.id}")
#         expect(page).to have_content(merchant_1.name)
#
#       end
#     end
#   end
# end
