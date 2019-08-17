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
hippy = Merchant.create( name: 'Crunchy Hippy', address: '4015 Haight Street', city: 'San Fransico', state:'CA', zip: '90234')
bob.items.create( name: 'Bushy Brush',
                  description: 'A lovely bushy brush for brushing bushes.',
                  price: 12.99,
                  image: 'http://www.asianbrushpainter.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/a/happiness-highland-bull-horn-brush-black-goat-hair-1_27.jpg',
                  inventory: 32)

bob.items.create( name: 'Starter Paint Set',
                  description: '24 beautiful natural colors for you to blend and stroke to your hearts content',
                  price: 37.99,
                  image: 'https://cdn.dick-blick.com/items/016/37/01637-0249-5-1-2ww-m.jpg',
                  inventory: 17)

bob.items.create ( name: 'Bob Quote Poster',
                   description: 'Words to live by. Be reminded of the joy every day.',
                   price: 18.75,
                   image: => "https://www.bobrosslipsum.com/images/quotes/quote-leaf-gifts.jpg",
                   inventory: 12)

yum.items.create( name: 'Chocolate Crunchy Taco Chips',
                  description: 'Crunchy corn chips with dark chocolate and chili powder!',
                  price: 3.79,
                  image: 'https://www.abdallahcandies.com/wp-content/uploads/2017/11/CHOC-COV-POTATO-CHIPS.png',
                  inventory: 23)

yum.items.create( name: 'Nut Butter Puff Balls',
                  description: 'Puffed quinoa balls with almond butter and dried cranberries.',
                  price: 6.79,
                  image: 'http://www.thewheatlesskitchen.com/wp-content/uploads/2013/08/IMG_0669.jpg',
                  inventory: 42)

yum.items.create( name: 'Chili Lime Dried Mango',
                  description: 'Dried mango slices covered in chili powder and lime juice.',
                  price: 7.99,
                  image: 'https://www.fruitland.us/wp-content/uploads/2015/03/Mango-Chili-6-09207-61888-1.jpg',
                  inventory: 19)

hippy.items.create( name: 'Vintage Tie-Dyed T-Shirt',
                    description: 'Jim found this gem in the gutter, but he gave it a good wash and it is as good as new!',
                    price: 25,
                    image: 'https://cdn2.bigcommerce.com/server2800/677b8/products/38681/images/116888/11327f__53975.1546886182.1100.1100.jpg?c=2',
                    inventory: 1)

hippy.items.create( name: 'Trippy Lava Lamp',
                    description: 'Lava lamps really tie a room together. They are far out, man!',
                    price: 22.50  ,
                    image: 'https://i.pinimg.com/736x/73/22/0d/73220d10518c09cc64a4eeb39a6f00ec.jpg',
                    inventory: 1)
