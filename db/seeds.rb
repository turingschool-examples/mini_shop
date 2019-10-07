hills_shop = Merchant.create({name: "Hills Shop", address: "123 Plant Drive", city: "Denver", state: "Colorado", zip: "80210" })
amys_shop = Merchant.create({name: "Amys Shop", address: "678 Aloe Drive", city: "Denver", state: "Colorado", zip: "80210" })
megs_shop = Merchant.create({name: "Megs Shop", address: "987 Fiddle Place", city: "Denver", state: "Colorado", zip: "80210" })

item_1 = hills_shop.items.create(
  name: "Fiddle Leaf",
  description: "The Fiddle Leaf Fig is easily recognizable and loved for its distinctive foliage. This tall, dramatic plant has very large, heavily veined, violin-shaped leaves that grow upright. It’s not bushy, making it a beautiful addition for a brightly lit corner or cozy nook in your home.",
  price: 45,
  image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-fiddle-leaf-fig-slate-2-e1558203121213-1500x1824.jpg",
  status: "active",
  inventory: 23,
  merchant_name: hills_shop.name
)

item_2 = hills_shop.items.create(
  name: "Croton Petra",
  description: "You can’t miss this plant, as it has some of the boldest and brightest foliage around. Often vividly marked with bright yellow, orange, and red, Crotons add a tropical touch to your home. These exotic plants have a reputation for being high-maintenance due to their tropical nature, but hey, sometimes it requires a little work to stay beautiful! Croton Petra is native to southern Asia and the western Pacific Islands where the humidity levels are higher. In addition to lots of bright light to encourage their deep and varied coloring, this beautiful plant will appreciate regular misting. Don’t be afraid to group a few of these stunning plants together— it helps raise the humidity level naturally and benefits all the plants.",
  price: 150,
  image: "https://bloomscape.com/wp-content/uploads/2019/09/bloomscape_product_croton-petra.jpg",
  status: "active",
  inventory: 23,
  merchant_name: hills_shop.name
)

item_3 = hills_shop.items.create(
  name: "Spider Plant",
  description: "The Spider plant is among the most adaptable houseplant and very easy to grow. A graceful plant that makes a statement anywhere—from a tabletop to a mantle, or with its lovely arching leaves as a hanging plant. The Spider Plant is also known for its tremendous air purifying qualities, making it a healthy addition to your home as well. Native to tropical and southern Africa, Spider plants have a reputation for being nearly impossible to kill. These fast-growing, fun plants are a great option for the first-time plant owner.",
  price: 35,
  image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape-product-spider-plant-charcoal-2.jpg",
  status: "active",
  inventory: 23,
  merchant_name: hills_shop.name
)

item_4 = hills_shop.items.create(
  name: "Hedgehog Aloe",
  description: "Hedgehog Aloe is a very forgiving succulent, making it a perfect plant for hectic households or for first-time owners. This plant makes quite an impression with its blue-green leaves and will often produce unique spikes of coral-red flowers in the spring and late summer.",
  price: 45,
  image: "https://bloomscape.com/wp-content/uploads/2019/04/bloomscape_product-hedgehog-ale-stone-1.jpg",
  status: "active",
  inventory: 23,
  merchant_name: hills_shop.name
)

item_5 = hills_shop.items.create(
  name: "Kimberly Queen Fern",
  description: "The Kimberly Queen Fern is more compact, neater, and easier to care for than its familiar cousins, the Boston or Dallas Fern. This plant grows upright, making it perfect for hanging baskets, and its long, vertical, sword-shaped fronds never leave a mess. This makes the Kimberly Queen Fern a low-maintenance choice to soften classic lines and complements mid-century decor.",
  price: 65,
  image: "https://bloomscape.com/wp-content/uploads/2019/03/bloomscape_product-kimberly-queen-fern-slate-2-1140x1382.jpg",
  status: "active",
  inventory: 23,
  merchant_name: hills_shop.name
)

item_6 = hills_shop.items.create(
  name: "Parlor Palm",
  description: "This slow-growing, compact palm thrives in a variety of light situations and tight spaces. It’s dark green fronds create a bushy, lush plant perfect for tabletops, desks, and shelves.",
  price: 65,
  image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-parlor-palm-charcoal-2.jpg",
  status: "active",
  inventory: 23,
  merchant_name: hills_shop.name
)

item_1 = amys_shop.items.create(
  name: "Crocodile Fern",
  description: "The veins throughout the foliage are very distinct and give the leaves an incredible texture. Obviously, this is where the common name, Crocodile Fern, originates. Like many other ferns, this plant is epiphytic in nature, meaning that it has the ability to grow attached to trees or even in the cracks of rocks.",
  price: 65,
  image: "https://bloomscape.com/wp-content/uploads/2019/10/bloomscape_product_crocodile-fern_clay-1500x1830.jpg",
  status: "active",
  inventory: 23,
  merchant_name: amys_shop.name
)

item_2 = amys_shop.items.create(
  name: "Parlor Palm",
  description: "This slow-growing, compact palm thrives in a variety of light situations and tight spaces. It’s dark green fronds create a bushy, lush plant perfect for tabletops, desks, and shelves.",
  price: 65,
  image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-parlor-palm-charcoal-2.jpg",
  status: "active",
  inventory: 23,
  merchant_name: amys_shop.name
)

item_3 = amys_shop.items.create(
  name: "Monstera Slate",
  description: "The Monstera originates from the tropical rainforests of southern Mexico and is extremely adaptable to indoor conditions. It loves bright, indirect light, but will be happy under fluorescent lights as well. Monsteras are climbers, so as it grows, it will want to vine out. This impressive, wild plant is also tolerant to the occasional missed watering, making it an ideal addition for any home.",
  price: 150,
  image: "https://bloomscape.com/wp-content/uploads/2019/04/bloomscape_product-monstera-slate.jpg",
  status: "active",
  inventory: 23,
  merchant_name: amys_shop.name
)

item_4 = amys_shop.items.create(
  name: "Bird of Paradise",
  description: "The Bird of Paradise is considered the queen of the indoor plant world. This large, upright plant adds a rich, tropical flair to your space as its glossy, banana-shaped leaves fan out. It is relatively hardy and adapts to a wide spectrum of light conditions from direct sun to low, indirect light, but will flourish in a sunny spot.",
  price: 195,
  image: "https://bloomscape.com/wp-content/uploads/2019/03/0004_bloomscape_product-bird-of-paradise-indigo.jpg",
  status: "active",
  inventory: 23,
  merchant_name: amys_shop.name
)

item_1 = megs_shop.items.create(
  name: "Majesty Palm",
  description: "The Majesty Palm is a robust, low maintenance, classic palm that adds stately beauty to any room in your home. Even though this plant is unmistakably tropical, its elegant fronds will complement any decor. It grows slowly, and will maintain its size so you don’t need to worry about it outgrowing its spot.",
  price: 195,
  image: "https://bloomscape.com/wp-content/uploads/2019/04/bloomscape_product-majesty-palm-stone.jpg",
  status: "active",
  inventory: 3,
  merchant_name: megs_shop.name
)

item_2 = megs_shop.items.create(
  name: "ZZ Plant",
  description: "The ZZ Plant is graceful with wand-like stems that taper to a point. Along the stem are fleshy, oval-shaped, shiny leaves giving it a distinctive feathered appearance.",
  price: 155,
  image: "https://bloomscape.com/wp-content/uploads/2019/03/bloomscape_product-zz-plant-slate-1-1.jpg",
  status: "active",
  inventory: 23,
  merchant_name: megs_shop.name
)

item_3 = megs_shop.items.create(
  name: "Ponytail Palm",
  description: "The Ponytail Palm is drought tolerant, slow-growing, and requires very little care. This plant is ideal for people with very little time or who travel regularly. The Ponytail Palm will be perfectly happy being watered every couple of weeks and left alone to soak up the sunlight. This distinct plant brings a little fun to any room in your home.",
  price: 65,
  image: "https://bloomscape.com/wp-content/uploads/2019/03/bloomscape_product-ponytail-palm-clay.jpg",
  status: "active",
  inventory: 23,
  merchant_name: megs_shop.name
)

item_4 = megs_shop.items.create(
  name: "Emerald Ripple Cactus",
  description: "The Eritrea Emerald Ripple is a tall five-sided cactus with wavy edges. As long as you provide it with the light, water, and nutrients that it needs, the cactus can thrive anywhere in your home.",
  price: 65,
  image: "https://bloomscape.com/wp-content/uploads/2019/04/bloomscape_product-emerald-ripple-cactus-indigo-1500x1830.jpg",
  status: "active",
  inventory: 23,
  merchant_name: megs_shop.name
)
