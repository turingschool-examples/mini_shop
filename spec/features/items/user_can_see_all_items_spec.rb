require 'rails_helper'

# As a visitor
RSpec.describe "Items index" do
  describe "as a visitor" do
    it "has all the items and their name, description, price
        image, active/inactive status, and inventory" do

        batteries = Item.create( name: "Batteries",
                              description: "Bunch of loose batteries of undetermined efficacy",
                              price: 4.50,
                              image: '/assets/batteries.jpeg',
                              status: 'active',
                              inventory: 10,
                            )

        blanket = Item.create( name: "Blanket",
                              description: "Soft and lightweight blanket",
                              price: 4.50,
                              image: '/assets/blanket.png',
                              status: 'inactive',
                              inventory: 4,
                            )

        lightbulb = Item.create( name: "Lightbulb",
                              description: "Let there be light",
                              price: 4.50,
                              image: '/assets/lightbulb.jpg',
                              status: 'active',
                              inventory: 12,
                            )

        keys = Item.create( name: "Key duplication",
                              description: "Let us create a duplicate key for you fast",
                              price: 4.50,
                              image: '/assets/keys.jpeg',
                              status: 'active',
                              inventory: 12,
                            )

        pallet = Item.create( name: "Scrap Wood",
                              description: "Reduce, reuse, recycle",
                              price: 4.50,
                              image: '/assets/pallet.jpg',
                              status: 'active',
                              inventory: 12,
                            )
        visit '/items'

        expect(page).to have_content(batteries.name)
        expect(page).to have_content(batteries.description)
        expect(page).to have_content(batteries.price)
        expect(page).to have_content(batteries.status)
        expect(page).to have_content(batteries.inventory)
        # expect(page).to have_css("img[src*='/assetss/batteries.jpeg']")
        expect(page).to have_content(blanket.name)
        expect(page).to have_content(blanket.description)
        expect(page).to have_content(blanket.price)
        expect(page).to have_content(blanket.status)
        expect(page).to have_content(blanket.inventory)

        expect(page).to have_content(lightbulb.name)
        expect(page).to have_content(lightbulb.description)
        expect(page).to have_content(lightbulb.price)
        expect(page).to have_content(lightbulb.status)
        expect(page).to have_content(lightbulb.inventory)

        expect(page).to have_content(keys.name)
        expect(page).to have_content(keys.description)
        expect(page).to have_content(keys.price)
        expect(page).to have_content(keys.status)
        expect(page).to have_content(keys.inventory)

        expect(page).to have_content(batteries.name)
        expect(page).to have_content(batteries.description)
        expect(page).to have_content(batteries.price)
        expect(page).to have_content(batteries.status)
        expect(page).to have_content(batteries.inventory)

    end
  end
end
# When I visit '/items'
# Then I see each Item in the system including the Item's:
# - name
# - description
# - price
# - image
# - active/inactive status
# - inventory
# - the name of the merchant that sells the ite
