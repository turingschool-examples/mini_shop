@chocolate_store = Merchant.create(name: 'The Chocolate Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
@caramel_store = Merchant.create(name: 'The Caramel Store', address: '123 Oak Ave', city: 'Golden', state: 'CO', zip: 80_021)

@chocolate_bar = @chocolate_store.items.create!(name: 'Chocolate', description: 'It is chocolate', price: 3, image: 'https://previews.123rf.com/images/tashka2000/tashka20001104/tashka2000110400002/9286183-slices-of-chocolate-bar-isolated-on-white-background.jpg', inventory: 15)
@caramel_bar = @caramel_store.items.create!(name: 'Caramel', description: 'It is caramel', price: 2, image: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/12/11/0/VP0104H_Caramels_s4x3.jpg.rend.hgtvcom.826.620.suffix/1513028933152.jpeg', inventory: 10)
