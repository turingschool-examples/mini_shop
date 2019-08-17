require 'rails_helper'

describe Item do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_presence_of :image }
    it { should validate_presence_of :inventory }
    it { should validate_inclusion_of(:active).in_array [true, false] }
  end

  describe 'relationships' do
    it { should belong_to :merchant }
  end

  describe 'instance methods' do
    it 'status active or inactive for item.active' do
      bob = Merchant.create( name: 'Bob Ross Paints', address: '2345 Happy Tree Place', city: 'Boulder', state: 'CO', zip: '80303')
      brush = bob.items.create( name: 'Bushy Brush',
                        description: 'A lovely bushy brush for brushing bushes.',
                        price: 12.99,
                        image: 'http://www.asianbrushpainter.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/a/happiness-highland-bull-horn-brush-black-goat-hair-1_27.jpg',
                        active: true,
                        inventory: 32)

      paint = bob.items.create( name: 'Starter Paint Set',
                        description: '24 beautiful natural colors for you to blend and stroke to your hearts content',
                        price: 37.99,
                        image: 'https://cdn.dick-blick.com/items/016/37/01637-0249-5-1-2ww-m.jpg',
                        active: false,
                        inventory: 17)

      expect(brush.status).to eq('Active')
      expect(paint.status).to eq('Inactive')
    end
  end
end
