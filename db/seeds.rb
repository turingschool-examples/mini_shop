# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

merchants = Merchant.create([
  {
    name: 'Back to the Fuschia',
    address: '943 Burberry Drive',
    city: 'Kirksville',
    state: 'NC',
    zip: 30846
  },
  {
    name: 'Florist Gump',
    address: '1523 N Main Street',
    city: 'Plaintree',
    state: 'MN',
    zip: 49155
  },
  {
    name: 'Pine Oakio',
    address: '12 Montgomery Lane',
    city: 'Alden',
    state: 'AL',
    zip: 61350
  }
])

items = Item.create([
  {
    name: 'Plumeria Plant',
    description: 'The PlumeriaTree, also known as the "Scent of Hawaii", is like no other plant. It has electric hues of yellow, pink, and white blossoms that bloom from April until November. It also has a slender, geometric shape, and soft foliage that will branch and produce up to 60 flowers and over 100 blossoms gradually each year.',
    price: 93.20,
    image: 'https://images.pexels.com/photos/63609/plumeria-flower-frangipani-plant-63609.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    active_status: true,
    inventory: 14,
    merchant_id: merchants[0].id
  },
  {
    name: 'Contraste Dahlia Bulbs',
    description: 'A timeless favorite, introduced almost 60 years ago and still going strong. The big blooms measure up to 8 inches across and have striking two-tone petals that are deep burgundy and purple with brilliant white tips.',
    price: 15.40,
    image: 'https://images.pexels.com/photos/599679/pexels-photo-599679.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    active_status: true,
    inventory: 32,
    merchant_id: merchants[0].id
  },
  {
    name: 'Clementine Rose Bush',
    description: 'This rose bush grows long, pointed buds that open to classically shaped 4 inch blooms that have an artistic feel to their color - a rich apricot-blush, over-layed with copper toward the edge of the petals. The striking blooms are plentifully produced against bright-green, glossy leaves.',
    price: 45.63,
    image: 'https://images.pexels.com/photos/60520/rose-roses-flora-flower-60520.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    active_status: false,
    inventory: 8,
    merchant_id: merchants[0].id
  },

  {
    name: 'Pink Tropical Hibiscus Tree',
    description: 'Adding a tropical feel to your garden or landscape has never been easier. The Pink Tropical Hibiscus Tree is a low-maintenance dwarf tree, reaching only 6-8 feet in height.',
    price: 108.65,
    image: 'https://images.pexels.com/photos/244796/pexels-photo-244796.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    active_status: true,
    inventory: 6,
    merchant_id: merchants[2].id
  },
  {
    name: 'Arbequina Olive Tree',
    description: "It's the most versatile variety on the market: The Arbequina Olive Tree. Not only does it produce table olives, but it's also used to make highly-valued olive oil. And this tree offers evergreen beauty and fragrant spring blooms to go along with its succulent fruit.",
    price: 84.99,
    image: 'https://images.pexels.com/photos/2086351/pexels-photo-2086351.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    active_status: false,
    inventory: 4,
    merchant_id: merchants[2].id
  },
])










# fuscia = Merchant.create(
#   name: 'Back to the Fuschia',
#   address: '943 Burberry Drive',
#   city: 'Kirksville',
#   state: 'NC',
#   zip: 30846
# )
#
# florist = Merchant.create(
#   name: 'Florist Gump',
#   address: '1523 N Main Street',
#   city: 'Plaintree',
#   state: 'MN',
#   zip: 49155
# )
#
# pineoakio = Merchant.create(
#   name: 'Pine Oakio',
#   address: '12 Montgomery Lane',
#   city: 'Alden',
#   state: 'AL',
#   zip: 61350
# )
