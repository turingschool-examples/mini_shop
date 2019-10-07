best_buy = Merchant.create(
  name: 'Best Buy',
  address: '123 Main St',
  city: 'Lakewood',
  state: 'CO',
  zip: '80128'
)
best_buy.items.create(
  name: "Macbook Pro 13\"",
  description: "Apple Macbook Pro 13\" 8GB DDR3 Memory",
  price: '1299.01',
  image: 'https://images-na.ssl-images-amazon.com/images/I/61SJu997CCL._SL1500_.jpg',
  inventory: '730',
)
best_buy.items.create(
  name: "VIZIO 42\"",
  description: "42\" Plasma Screen TV 4K quality",
  price: '759.99',
  image: 'https://cdn-ssl.vizio.com/media/catalog/product/cache/1/image/1920x1395/040ec09b1e35df139433887a97daa66f/e/4/e420i-b0.jpg',
  inventory: '200',
)
####################################################################################################################
costco = Merchant.create(
  name: 'Costco',
  address: '123 Main st',
  city: 'Lakewood',
  state: 'CO',
  zip: '80127'
)
costco.items.create(
  name: 'Goldfish',
  description: '24 count of snack goldfish packs',
  price: '10.99',
  image: 'https://images-na.ssl-images-amazon.com/images/I/51g4wmu9MEL.jpg',
  inventory: '730',
)
costco.items.create(
  name: 'Cheez-Its',
  description: '45 count of snack cheez-it packs',
  price: '14.99',
  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8-8XA-5ay0GQ2Z0QzLFhpIZsWg49ZBA26sjOHaVw4qr_qoowJ',
  inventory: '500',
)
####################################################################################################################
walmart = Merchant.create(
  name: 'Walmart',
  address: '6493 w Childrens pl',
  city: 'Chowder',
  state: 'TN',
  zip: '6748'
)
walmart.items.create(
  name: 'Mongoose Byte Mountain Bike',
  description: "20\" wheels, 7 speeds, girls frame, ages 6 and up, Grey",
  price: '109.99',
  image: 'https://i5.walmartimages.com/asr/bb8d9aea-67e7-4c1a-b7bb-04a274189d19_1.480c87c3b6ae5b2e77b9dedec38f4830.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF',
  inventory: '37',
)
walmart.items.create(
  name: 'Kiddie Pool',
  description: "Summer Waves 59\" Wading Pool Assortment",
  price: '3.99',
  image: 'https://i5.walmartimages.com/asr/f653bdec-4791-4ce1-9bb1-587aa251bc59_1.f602e6acb43d4ef83658ccbc7bd4513a.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF',
  inventory: '1674',
)
