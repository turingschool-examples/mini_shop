require 'rails_helper'

describe 'When user visits items index page' do
  it 'Should show a list of all the items in the shop' do
    bob = Merchant.create( name: 'Bob Ross Paints', address: '2345 Happy Tree Place', city: 'Boulder', state: 'CO', zip: '80303')
    yum = Merchant.create( name: 'Yum Yum Snacks', address: '123 Tasty Town Ave', city: 'Denver', state: 'CO', zip: '80239')
    brush = bob.items.create( name: 'Bushy Brush',
                      description: 'A lovely bushy brush for brushing bushes.',
                      price: 12.99,
                      image: 'http://www.asianbrushpainter.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/a/happiness-highland-bull-horn-brush-black-goat-hair-1_27.jpg',
                      active: true,
                      inventory: 32)

    snack = yum.items.create( name: 'Chocolate Crunchy Taco Chips',
                      description: 'Crunchy corn chips with dark chocolate and chili powder!',
                      price: 3.79,
                      image: 'https://www.abdallahcandies.com/wp-content/uploads/2017/11/CHOC-COV-POTATO-CHIPS.png',
                      active: true,
                      inventory: 23)

    visit '/items'

    expect(page).to have_content(brush.name)
    expect(page).to have_content(brush.description)
    expect(page).to have_content(brush.price)
    expect(page).to have_xpath("//img[@src='http://www.asianbrushpainter.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/a/happiness-highland-bull-horn-brush-black-goat-hair-1_27.jpg']")
    expect(page).to have_content(brush.status)
    expect(page).to have_content(brush.inventory)
    expect(page).to have_link('Bob Ross Paints')

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.description)
    expect(page).to have_content(snack.price)
    expect(page).to have_xpath("//img[@src='https://www.abdallahcandies.com/wp-content/uploads/2017/11/CHOC-COV-POTATO-CHIPS.png']")
    expect(page).to have_content(snack.status)
    expect(page).to have_content(snack.inventory)
    expect(page).to have_link('Yum Yum Snacks')
  end

  describe 'User visits the merchants index page and clicks merchant link' do
    it 'They are taken to a page that shows all of that merchants items' do
      bob = Merchant.create( name: 'Bob Ross Paints', address: '2345 Happy Tree Place', city: 'Boulder', state: 'CO', zip: '80303')
      yum = Merchant.create( name: 'Yum Yum Snacks', address: '123 Tasty Town Ave', city: 'Denver', state: 'CO', zip: '80239')
      brush = bob.items.create( name: 'Bushy Brush',
                        description: 'A lovely bushy brush for brushing bushes.',
                        price: 12.99,
                        image: 'http://www.asianbrushpainter.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/a/happiness-highland-bull-horn-brush-black-goat-hair-1_27.jpg',
                        inventory: 32)

      paint = bob.items.create( name: 'Starter Paint Set',
                        description: '24 beautiful natural colors for you to blend and stroke to your hearts content',
                        price: 37.99,
                        image: 'https://cdn.dick-blick.com/items/016/37/01637-0249-5-1-2ww-m.jpg',
                        inventory: 17)

      chips = yum.items.create( name: 'Chocolate Crunchy Taco Chips',
                        description: 'Crunchy corn chips with dark chocolate and chili powder!',
                        price: 3.79,
                        image: 'https://www.abdallahcandies.com/wp-content/uploads/2017/11/CHOC-COV-POTATO-CHIPS.png',
                        inventory: 23)

      visit '/merchants'
      click_link 'Bob Ross Paints'
      click_link 'View All Items'

      expect(current_path).to eq("/merchants/#{bob.id}/items")
      expect(page).to have_content(brush.name)
      expect(page).to_not have_content(brush.description)
      expect(page).to have_content(brush.price)
      expect(page).to have_xpath("//img[@src='http://www.asianbrushpainter.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/a/happiness-highland-bull-horn-brush-black-goat-hair-1_27.jpg']")
      expect(page).to have_content(brush.status)
      expect(page).to have_content(brush.inventory)

      expect(page).to have_content(paint.name)
      expect(page).to_not have_content(paint.description)
      expect(page).to have_content(paint.price)
      expect(page).to have_xpath("//img[@src='https://cdn.dick-blick.com/items/016/37/01637-0249-5-1-2ww-m.jpg']")
      expect(page).to have_content(paint.status)
      expect(page).to have_content(paint.inventory)

      expect(page).to have_link('Bob Ross Paints')

      expect(page).to_not have_content(chips.name)
      expect(page).to_not have_content(chips.price)
      expect(page).to_not have_xpath("//img[@src='https://www.abdallahcandies.com/wp-content/uploads/2017/11/CHOC-COV-POTATO-CHIPS.png']")
      expect(page).to_not have_content(chips.inventory)
      expect(page).to_not have_link('Yum Yum Snacks')
    end
  end
end
