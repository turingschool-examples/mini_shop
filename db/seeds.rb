@chocolate_store = Merchant.create(name: 'The Chocolate Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
@caramel_store = Merchant.create(name: 'The Caramel Store', address: '123 Oak Ave', city: 'Golden', state: 'CO', zip: 80_021)

@chocolate_bar = @chocolate_store.items.create!(name: 'Chocolate', description: 'It is chocolate', price: 3, image: 'https://grandvalleyhempinfusions.com/wp-content/uploads/2019/02/cbd-chocolate-bar-1.jpg', inventory: 15)
@caramel_bar = @caramel_store.items.create!(name: 'Caramel', description: 'It is caramel', price: 2, image: 'https://www.kingarthurflour.com/sites/default/files/recipe_legacy/5703-3-large.jpg', inventory: 10)
