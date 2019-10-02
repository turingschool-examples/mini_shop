# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

merchants = Merchant.create([
  {name: 'Back to the Fuschia', address: '943 Burberry Drive', city: 'Kirksville', state: 'NC', zip: 30846},
  {name: 'Florist Gump', address: '1523 N Main Street', city: 'Plaintree', state: 'MN', zip: 49155},
  {name: 'Pine Oakio', address: '12 Montgomery Lane', city: 'Alden', state: 'AL', zip: 61350},
  ])
