hills_shop = Merchant.create({name: "Hills Shop", address: "not cool place", city: "denver", state: "colorado", zip: "80210" })
item_1 = hills_shop.items.create(
  name: "Fiddle Leaf", 
  description: "beautiful", 
  price: 45, 
  image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-fiddle-leaf-fig-slate-2-e1558203121213-1500x1824.jpg",
  status: "active",
  inventory: 23,
  merchant_name: hills_shop.name
)