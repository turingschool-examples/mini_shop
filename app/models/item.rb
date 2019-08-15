class Item < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name, :description, :price, :image, :active?, :inventory

  def convert_price
    str = self.price.to_s.chars
    if str.reverse.index(".") == 1
      str << "0"
    end
    str.join
  end

end
