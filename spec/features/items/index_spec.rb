require 'rails_helper'

describe 'When user visits items index page' do
  it 'Should show a list of all the items in the shop' do
    bob = Merchant.create( name: 'Bob Ross Paints', address: '2345 Happy Tree Place', city: 'Boulder', state: 'CO', zip: '80303')
    yum = Merchant.create( name: 'Yum Yum Snacks', address: '123 Tasty Town Ave', city: 'Denver', state: 'CO', zip: '80239')
    bob.items.create( name: 'Bushy Brush',
                      description: 'A lovely bushy brush for brushing bushes.',
                      price: 12.99,
                      image: 'http://www.asianbrushpainter.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/a/happiness-highland-bull-horn-brush-black-goat-hair-1_27.jpg',
                      active: true,
                      inventory: 32)

    yum.items.create( name: 'Chocolate Crunchy Taco Chips',
                      description: 'Crunchy corn chips with dark chocolate and chili powder!',
                      price: 3.79,
                      image: 'https://www.abdallahcandies.com/wp-content/uploads/2017/11/CHOC-COV-POTATO-CHIPS.png',
                      active: true,
                      inventory: 23)

    visit '/items'

    expect(page).to have_content('Bushy Brush')
    expect(page).to have_content('A lovely bushy brush for brushing bushes.')
    expect(page).to have_link('Bob Ross Paints')

    expect(page).to have_content('Chocolate Crunchy Taco Chips')
    expect(page).to have_content('Crunchy corn chips with dark chocolate and chili powder!')
    expect(page).to have_link('Yum Yum Snacks')
  end
end
