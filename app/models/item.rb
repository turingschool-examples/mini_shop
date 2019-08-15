class Item < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name, :description, :price, :image, :inventory
  validates_inclusion_of :active, :in => [true, false]

  def buy
    if self.inventory <= 0
      self.update(active: false)
    end
    if self.inventory > 0
      self.inventory -= 1
    end
    if self.inventory <= 0
      self.update(active: false)
    end
    self.save!
  end

  def restock
    if self.inventory > 0
      self.update(active: true)
    end
  end

end
