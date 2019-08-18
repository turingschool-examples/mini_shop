# As a visitor
# When I visit '/items/:id'
# Then I see the item with that id including the item's:
# - name
# - active/inactive status
# - price
# - description
# - image
# - inventory
# - the name of the merchant that sells the item
require 'rails_helper'

RSpec.describe 'Item Show page' do
  before :each do
    @pink = Merchant.create(name: 'PINK', address: '3000 E 1st Ave', city: 'Denver', state: 'CO', zip: 80206)
    @ulta = Merchant.create(name: 'Ulta', address: '1150 S Ironton', city: 'Aurora', state: 'CO', zip: 80012)
    @chocolate_gold = ulta.items.create(name: 'Eyeshadow Palette', description: 'Too Faced Chocolate Gold 99 g Eyeshadow Palette', price: 55, image: 'https://rukminim1.flixcart.com/image/704/704/jcqjr0w0/eye-shadow/6/v/y/99-chocolate-gold-too-faced-original-imaffsucfzhtkzzv.jpeg?q=70', status: true, inventory: 20)
  end

  it "show merchant's item details" do
    visit "/merchants/#{@ulta.id}/items"

    expect(page).to have_content(@chocolate_gold.name)
    expect(page).to have_content(@chocolate_gold.price)
    expect(page).to have_content(@chocolate_gold.description)
    expect(page).to have_content(@chocolate_gold.image)
    expect(page).to have_content(@chocolate_gold.status)
    expect(page).to have_content(@chocolate_gold.inventory)
    expect(page).to have_content(@ulta)
  end
end
