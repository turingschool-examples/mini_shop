require 'rails_helper'

describe "As a visitor" do
  describe "When I click on the name of a merchant anywhere on the site" do
    it "takes me to that merchant's show page from any merchant page" do
      merchant_1 = Merchant.create( name: "Corner Store",
                                    address: "234 Yarp Dr.",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80211")
      merchant_2 = Merchant.create( name: "Store Store",
                                    address: "567 Narp Dr.",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80203")

      merchant_3 = Merchant.create( name: "Your More Store",
                                    address: "890 Aardvark Dr.",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80201")

      batteries = merchant_3.items.create( name: "Batteries",
                            description: "Bunch of loose batteries of undetermined efficacy",
                            price: 4.50,
                            image: 'batteries.jpeg',
                            status: 'active',
                            inventory: 10,
                          )

      blanket = merchant_3.items.create( name: "Blanket",
                            description: "Soft and lightweight blanket",
                            price: 4.50,
                            image: '/assets/blanket.png',
                            status: 'inactive',
                            inventory: 4,
                          )

      lightbulb = merchant_2.items.create( name: "Lightbulb",
                            description: "Let there be light",
                            price: 4.50,
                            image: '/assets/lightbulb.jpg',
                            status: 'active',
                            inventory: 12,
                          )

      keys = merchant_2.items.create( name: "Key duplication",
                            description: "Let us create a duplicate key for you fast",
                            price: 4.50,
                            image: '/assets/keys.jpeg',
                            status: 'active',
                            inventory: 12,
                          )

      pallet = merchant_1.items.create( name: "Scrap Wood",
                            description: "Reduce, reuse, recycle",
                            price: 4.50,
                            image: '/assets/pallet.jpg',
                            status: 'active',
                            inventory: 12,
                          )

      visit("/merchants")
      click_link("Corner Store")
      expect(current_path).to eq("/merchants/#{merchant_1.id}")

      visit("/merchants")
      click_link("Store Store")
      expect(current_path).to eq("/merchants/#{merchant_2.id}")

      visit("/merchants")
      click_link("Your More Store")
      expect(current_path).to eq("/merchants/#{merchant_3.id}")


      visit("/merchants/#{merchant_1.id}/items")
      click_link('Corner Store')
      expect(current_path).to eq("/merchants/#{merchant_1.id}")

      visit("/merchants/#{merchant_2.id}/items")
      click_link("Store Store")
      expect(current_path).to eq("/merchants/#{merchant_2.id}")

      visit("/merchants/#{merchant_2.id}/items")
      click_link("Store Store")
      expect(current_path).to eq("/merchants/#{merchant_2.id}")

      # items index
      visit("/items/")
      click_link("Corner Store")
      expect(current_path).to eq("/merchants/#{merchant_1.id}")

      visit("/items/")
      click_link("Store Store", match: :first)
      expect(current_path).to eq("/merchants/#{merchant_2.id}")

      visit("/items/")
      click_link("Your More Store", match: :first)
      expect(current_path).to eq("/merchants/#{merchant_3.id}")
      # item show
      visit("/items/#{batteries.id}")
      click_link("Your More Store")
      expect(current_path).to eq("/merchants/#{merchant_3.id}")

      visit("/items/#{blanket.id}")
      click_link("Your More Store")
      expect(current_path).to eq("/merchants/#{merchant_3.id}")

      visit("/items/#{lightbulb.id}")
      click_link("Store Store")
      expect(current_path).to eq("/merchants/#{merchant_2.id}")

      visit("/items/#{keys.id}")
      click_link("Store Store")
      expect(current_path).to eq("/merchants/#{merchant_2.id}")

      visit("/items/#{pallet.id}")
      click_link("Corner Store")
      expect(current_path).to eq("/merchants/#{merchant_1.id}")
    end
  end
end

# As a visitor
# When I click on the name a merchant anywhere on the site
# Then that link takes me to that Merchant's show page
