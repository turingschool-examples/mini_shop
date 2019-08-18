# As a visitor
# When I visit '/items'
# Then I see each Item in the system including the Item's:
# - name
# - description
# - price
# - image
# - active/inactive status
# - inventory
# - the name of the merchant that sells the item
require 'rails_helper'

RSpec.describe 'Items Index Page', type: :feature do
  before :each do
    @pink = Merchant.create(name: 'PINK', address: '3000 E 1st Ave', city: 'Denver', state: 'CO', zip: 80206)
    @ulta = Merchant.create(name: 'Ulta', address: '1150 S Ironton', city: 'Aurora', state: 'CO', zip: 80012)
    @hoodie = @pink.items.create(name: 'Hoodie', description: 'Dark Cherry Floral Zip Up Hoodie', price: 40, image: 'https://di2ponv0v5otw.cloudfront.net/posts/2018/05/21/5b02c9373b1608eb868d67bb/m_5b02c9433316271afbef32c2.jpg', status: true, inventory: 11)
    # @bling_leggings = @pink.items.create(name: 'Leggings', description: 'Bling Pocket Cotton Leggings', price: 45, image: 'Bling Pocket Cotton Leggings', status: true, inventory: 8)
    # @chocolate_gold = @ulta.items.create(name: 'Eyeshadow Palette', description: 'Too Faced Chocolate Gold 99 g Eyeshadow Palette', price: 55, image: 'https://rukminim1.flixcart.com/image/704/704/jcqjr0w0/eye-shadow/6/v/y/99-chocolate-gold-too-faced-original-imaffsucfzhtkzzv.jpeg?q=70', status: true, inventory: 20)
  end

  it 'shows all items' do
    visit '/items'

    expect(page).to have_content('Hoodie')
    expect(page).to have_content('Dark Cherry Floral Zip Up Hoodie')
    expect(page).to have_content(40)
    expect(page).to have_content(true)
    expect(page).to have_content(11)
    expect(page).to have_content('PINK')
  end
end

# As a visitor
# When I visit '/merchants/:merchant_id/items'
# Then I see each Item that belongs to the Merchant with that merchant_id including the Item's:
# - name
# - price
# - image
# - active/inactive status
# - inventory

RSpec.describe 'Items Index for one Merchant', type: :feature do
  before :each do
    @pink = Merchant.create(name: 'PINK', address: '3000 E 1st Ave', city: 'Denver', state: 'CO', zip: 80206)
    @ulta = Merchant.create(name: 'Ulta', address: '1150 S Ironton', city: 'Aurora', state: 'CO', zip: 80012)
    @hoodie = @pink.items.create(name: 'Hoodie', description: 'Dark Cherry Floral Zip Up Hoodie', price: 40, image: 'https://di2ponv0v5otw.cloudfront.net/posts/2018/05/21/5b02c9373b1608eb868d67bb/m_5b02c9433316271afbef32c2.jpg', status: true, inventory: 11)
    @bling_leggings = @pink.items.create(name: 'Leggings', description: 'Bling Pocket Cotton Leggings', price: 45, image: 'https://di2ponv0v5otw.cloudfront.net/posts/2019/02/23/5c713ab02beb7948b50ad0c8/m_5c713b1c2beb7948b50ad1bf.jpg', status: false, inventory: 8)
    @chocolate_gold = @ulta.items.create(name: 'Eyeshadow Palette', description: 'Too Faced Chocolate Gold 99 g Eyeshadow Palette', price: 55, image: 'https://rukminim1.flixcart.com/image/704/704/jcqjr0w0/eye-shadow/6/v/y/99-chocolate-gold-too-faced-original-imaffsucfzhtkzzv.jpeg?q=70', status: true, inventory: 20)
  end

  it 'shows items belonging to PINK' do
    visit "/merchants/#{@pink.id}/items"

    expect(page).to have_content('Hoodie')
    expect(page).to have_content(40)
    expect(page).to have_content(true)
    expect(page).to have_content(11)
    expect(page).to have_content('Leggings')
    expect(page).to have_content(45)
    expect(page).to have_content(false)
    expect(page).to have_content('8')
    expect(page).to_not have_content('Eyeshadow Palette')
  end
end
