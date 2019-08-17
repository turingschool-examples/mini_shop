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
    @hoodie = Item.create!(name: 'Hoodie', description: 'Black Pull Over Hoodie', price: 25, image: 'https://thenypost.files.wordpress.com/2018/03/shutterstock_450063892.jpg?quality=90&strip=all&w=618&h=410&crop=1', status: true, inventory: 11, merchant_id: @pink.id)
    # @hoodie = @pink.items.create!(name: 'Hoodie', description: 'Black Pull Over Hoodie', price: 25, image: 'https://thenypost.files.wordpress.com/2018/03/shutterstock_450063892.jpg?quality=90&strip=all&w=618&h=410&crop=1', status: true, inventory: 11)
  end

  it 'shows all items' do
    visit '/items'

    expect(page).to have_content('Hoodie')
    expect(page).to have_content('Black Pull Over Hoodie')
    expect(page).to have_content(25)
    expect(page).to have_content("https://thenypost.files.wordpress.com/2018/03/shutterstock_450063892.jpg?quality=90&strip=all&w=618&h=410&crop=1")
    expect(page).to have_content(true)
    expect(page).to have_content(11)
    expect(page).to have_content('PINK')
  end
end
