# As a visitor
# When I visit an item show page
# Then I see a link to delete the item
# When I click the link
# Then a 'DELETE' request is sent to '/items/:id',
# the item is deleted,
# and I am redirected to the item index page where I no longer see this item

require 'rails_helper'

describe 'User visits item show page and clicks delete link' do
  it 'Should delete the item' do
    yum = Merchant.create( name: 'Yum Yum Snacks', address: '123 Tasty Town Ave', city: 'Denver', state: 'CO', zip: '80239')
    snack = yum.items.create( name: 'Nut Butter Puff Balls',
                      description: 'Puffed quinoa balls with almond butter and dried cranberries.',
                      price: 6.79,
                      image: 'http://www.thewheatlesskitchen.com/wp-content/uploads/2013/08/IMG_0669.jpg',
                      active: true,
                      inventory: 42)
    visit '/items'
    expect(page).to have_content('Nut Butter Puff Balls')

    visit "/items/#{snack.id}"
    click_on 'Delete Item'

    expect(current_path).to eq('/items')
    expect(page).to_not have_content('Nut Butter Puff Balls')    
  end
end
