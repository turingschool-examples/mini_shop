describe 'Merchants Items index' do
  describe 'As a visitor' do
    hills_shop = Merchant.create(
      name: "Hills Shop",
      address: "not cool place",
      city: "denver",
      state: "colorado",
      zip: "80210"
    )
    item_1 = hills_shop.items.create(
      name: "Fiddle Leaf", 
      description: "beautiful", 
      price: 45, 
      image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-fiddle-leaf-fig-slate-2-e1558203121213-1500x1824.jpg",
      status: "active",
      inventory: 23,
      merchant_name: hills_shop.name
    )
    item_2 = hills_shop.items.create(
      name: "Snake Plant", 
      description: "v v beautiful", 
      price: 35, 
      image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-fiddle-leaf-fig-slate-2-e1558203121213-1500x1824.jpg",
      status: "active",
      inventory: 3,
      merchant_name: hills_shop.name
    )
    it 'I can see all items belonging to a specific merchant' do
      visit "/merchants/#{hills_shop.id}/items"

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_2.name)
    end
  end
end