# require 'rails_helper'
#
# # When I fill in the form with the item's:
# # - name
# # - price
# # - description
# # - image
# # - inventory
# # Then a `POST` request is sent to '/merchants/:merchant_id/items',
# # a new item is created for that merchant,
# # that item has a status of 'active',
# # and I am redirected to the Merchant Items Index page where I see the new item
#
# describe "Merchants items creation page" do
#   describe "As a visitor" do
#     it "can create a new item for a merchant" do
#
#       merchant = Merchant.create!( name: "Chesters Collectables",
#                                         address: "123 Fake St",
#                                         city: "Awesomeville",
#                                         state: "Montana",
#                                         zip: 59001,
#       )
#
#       item = merchant.items.create!( name: "Solid Gold Playing Cards",
#                               description: "One set of 52 solid gold playing cards.",
#                               price: 1200,
#                               image: "https://i.imgur.com/LlHMnHG.jpg",
#                               status: "Active",
#                               inventory: 2,
#           )
#
#       visit "/merchant/#{merchant.id}/items"
#
#       click_link 'Add Item'
#
#       expect current_path .to eq(/merchant/merchant.id/items/new)
#
#       fill_in('Item Name', with: ' ')
#
#
#     end
#   end
# end