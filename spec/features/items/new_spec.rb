# As a visitor
# When I visit a Merchant Items Index page
# Then I see a link to add a new item for that merchant
# When I click the link
# I am taken to '/merchants/:merchant_id/items/new' where I see a form to add a new item
# When I fill in the form with the item's:
# - name
# - price
# - description
# - image
# - inventory
# Then a `POST` request is sent to '/merchants/:merchant_id/items',
# a new item is created for that merchant,
# that item has a status of 'active',
# and I am redirected to the Merchant Items Index page where I see the new item
require 'rails_helper'

RSpec.describe 'Merchant Item Creation', type: :feature do
  describe 'When on a Merchant Items page' do
    before :each do
      @ulta = Merchant.create(name: 'Ulta', address: '1150 S Ironton', city: 'Aurora', state: 'CO', zip: 80012)
    end

    it 'has a link to create a new item for that merchant' do
        visit "/merchants/#{@ulta.id}/items"

        click_link 'Add New Item'

        expect(current_path).to eq("/merchants/#{@ulta.id}/items/new")

        fill_in :name, with: 'GLAMGLOW BUBBLESHEET'
        fill_in :price, with: 9
        fill_in :description, with: 'BUBBLESHEET™ Oxygenating Deep Cleanse Mask'
        fill_in :inventory, with: 30
        fill_in :image, with: 'https://www.glamglow.com/media/export/cms/products/516x671/gg_prod_G0M1Y8_516x671_1.jpg'

        click_on 'Create Item'
        @glamglow = Item.last

        expect(current_path).to eq("/merchants/#{@ulta.id}/")
        expect(page).to have_xpath("//img[@src='https://www.glamglow.com/media/export/cms/products/516x671/gg_prod_G0M1Y8_516x671_1.jpg']")
        expect(page).to have_content(@glamglow.name)
        expect(page).to have_content(@glamglow.price)
        expect(page).to have_content(@glamglow.description)
        expect(page).to have_content(@glamglow.inventory)
    end
  end
end
