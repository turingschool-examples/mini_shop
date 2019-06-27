# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@merchant1 = Merchant.create!(name: 'Tom Ford', image: 'http://www.tomfordbags.com/img/tom-ford-logo.jpg')
@merchant2 = Merchant.create!(name: 'Hermes', image: 'https://www.clickedstudios.com/wp-content/uploads/2019/02/hermes-logo.png')
@merchant3 = Merchant.create!(name: 'Liberty of London', image: 'https://is4-ssl.mzstatic.com/image/thumb/Purple122/v4/d9/3b/af/d93baf19-4836-edec-981e-dd5219dad858/source/512x512bb.jpg')
@merchant4 = Merchant.create!(name: 'Hunter', image: 'https://thebarnshoes.com/wp-content/uploads/2014/08/Hunter-Boots1.jpg')
@merchant5 = Merchant.create!(name: 'Edie Parker', image: 'https://fashionista.com/.image/t_share/MTQ5MzExODM3NTg0NzYyNTc1/edie-logo-copy.jpg')
@merchant6 = Merchant.create!(name: 'Golden Bear', image: 'https://www.thegoldenbear.com/images/logo.jpg')
