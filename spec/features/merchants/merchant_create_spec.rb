# require 'rails_helper'
#
# RSpec.describe "merchant create page", type: :feature do
#   it "can create a new merchant with a name, address, city, state, zip" do
#
#     merchant = Merchant.create( name: "Chesters Collectables",
#                                   address: "123 Fake St",
#                                   city: "Awesomeville",
#                                   state: "Montana",
#                                   zip: 59001,
#     )
#
#     visit 'merchants/new'
#     within("#merchants") do
#       fill_in 'Name', with: 'Chesters Collectables'
#       fill_in 'Address', with: '123 Fake St'
#       fill_in 'City', with: 'Awesomeville'
#       fill_in 'State', with: 'Montana'
#       fill_in 'Zip', with: 59001
#     end
#       click_button 'Submit'
#   end
# end