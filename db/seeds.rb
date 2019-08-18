# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
Merchant.destroy_all

pink = Merchant.create(name: 'PINK', address: '3000 E 1st Ave', city: 'Denver', state: 'CO', zip: 80206)
ulta = Merchant.create(name: 'Ulta', address: '1150 S Ironton', city: 'Aurora', state: 'CO', zip: 80012)
hoodie = pink.items.create(name: 'Hoodie', description: 'Dark Cherry Floral Pull Over Hoodie', price: 40, image: 'https://di2ponv0v5otw.cloudfront.net/posts/2018/05/21/5b02c9373b1608eb868d67bb/m_5b02c9433316271afbef32c2.jpg', status: true, inventory: 11)
bling_leggings = pink.items.create(name: 'Leggings', description: 'Bling Pocket Cotton Leggings', price: 45, image: 'https://di2ponv0v5otw.cloudfront.net/posts/2019/02/23/5c713ab02beb7948b50ad0c8/m_5c713b1c2beb7948b50ad1bf.jpg', status: false, inventory: 8)
chocolate_gold = ulta.items.create(name: 'Eyeshadow Palette', description: 'Too Faced Chocolate Gold 99 g Eyeshadow Palette', price: 55, image: 'https://rukminim1.flixcart.com/image/704/704/jcqjr0w0/eye-shadow/6/v/y/99-chocolate-gold-too-faced-original-imaffsucfzhtkzzv.jpeg?q=70', status: true, inventory: 20)
