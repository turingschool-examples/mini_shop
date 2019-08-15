# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
Merchant.destroy_all

bob = Merchant.create( name: 'Bob Ross Paints', address: '2345 Happy Tree Place', city: 'Boulder', state: 'CO', zip: '80303')
yum = Merchant.create( name: 'Yum Yum Snacks', address: '123 Tasty Town Ave', city: 'Denver', state: 'CO', zip: '80239')
bob.items.create( name: 'Bushy Brush',
                  description: 'A lovely bushy brush for brushing bushes.',
                  price: 12.99,
                  image: 'http://www.asianbrushpainter.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/a/happiness-highland-bull-horn-brush-black-goat-hair-1_27.jpg',
                  active: true,
                  inventory: 32)

bob.items.create( name: 'Starter Paint Set',
                  description: '24 beautiful natural colors for you to blend and stroke to your hearts content',
                  price: 37.99,
                  image: 'https://cdn.dick-blick.com/items/016/37/01637-0249-5-1-2ww-m.jpg',
                  active: true,
                  inventory: 17)

yum.items.create( name: 'Chocolate Crunchy Taco Chips',
                  description: 'Crunchy corn chips with dark chocolate and chili powder!',
                  price: 3.79,
                  image: 'https://www.abdallahcandies.com/wp-content/uploads/2017/11/CHOC-COV-POTATO-CHIPS.png',
                  active: true,
                  inventory: 23)

yum.items.create( name: 'Nut Butter Puff Balls',
                  description: 'Puffed quinoa balls with almond butter and dried cranberries.',
                  price: 6.79,
                  image: 'http://www.thewheatlesskitchen.com/wp-content/uploads/2013/08/IMG_0669.jpg',
                  active: true,
                  inventory: 42)
