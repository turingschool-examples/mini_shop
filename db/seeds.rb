best_buy = Merchant.create(
  name: 'Best Buy',
  address: '123 Main St',
  city: 'Lakewook',
  state: 'CO',
  zip: '80128'
)
best_buy.items.create(
  name: "Macbook Pro 13\"",
  description: "Apple Macbook Pro 13\" 8GB DDR3 Memory",
  price: '1299',
  image: 'https://images-na.ssl-images-amazon.com/images/I/61SJu997CCL._SL1500_.jpg',
  status: 'Active',
  inventory: '730',
)
