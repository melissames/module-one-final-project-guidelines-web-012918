class Item < ActiveRecord::Base

  has_many :inventories
  has_many :players, through: :inventories

  #   @name = "Guitar Pick" @points = 5
  #   @name = "Tie Dye Shirt" @points = 10
  #   @name = "China Cat Sunflower" @points = 15
  #   @name = "Steal Your Face" @points = 20
  #   @name = "Scarlet Begonia" @points = 25

end
