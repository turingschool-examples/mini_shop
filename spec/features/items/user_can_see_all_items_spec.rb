require 'rails_helper'

# As a visitor
RSpec.describe "Items index" do
  describe "as a visitor" do
    it "has all the items and their name, description, price
        image, active/inactive status, and inventory" do

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

        pallet = merchant_2.items.create( name: "Scrap Wood",
                              description: "Reduce, reuse, recycle",
                              price: 4.50,
                              image: '/assets/pallet.jpg',
                              status: 'active',
                              inventory: 12,
                            )
        visit '/items'

        expect(page).to have_content(batteries.name)
        expect(page).to have_content(batteries.description)
        # expect(page).to have_css("img[src*='#{batteries.image}']")
        expect(page).to have_content(batteries.price)
        expect(page).to have_content(batteries.status)
        expect(page).to have_content(batteries.inventory)

        expect(page).to have_content(blanket.name)
        expect(page).to have_content(blanket.description)
        expect(page).to have_css("img[src*='#{blanket.image}']")
        expect(page).to have_content(blanket.price)
        expect(page).to have_content(blanket.status)
        expect(page).to have_content(blanket.inventory)

        expect(page).to have_content(lightbulb.name)
        expect(page).to have_content(lightbulb.description)
        expect(page).to have_css("img[src*='#{lightbulb.image}']")
        expect(page).to have_content(lightbulb.price)
        expect(page).to have_content(lightbulb.status)
        expect(page).to have_content(lightbulb.inventory)

        expect(page).to have_content(keys.name)
        expect(page).to have_content(keys.description)
        expect(page).to have_css("img[src*='#{keys.image}']")
        expect(page).to have_content(keys.price)
        expect(page).to have_content(keys.status)
        expect(page).to have_content(keys.inventory)

        expect(page).to have_content(pallet.name)
        expect(page).to have_content(pallet.description)
        expect(page).to have_css("img[src*='#{pallet.image}']")
        expect(page).to have_content(pallet.price)
        expect(page).to have_content(pallet.status)
        expect(page).to have_content(pallet.inventory)

    end
  end
end
