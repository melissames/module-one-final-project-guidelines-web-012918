class Player < ActiveRecord::Base

  has_many :inventories
  has_many :items, through: :inventories
  after_initialize :defaults

  def defaults
    self.points ||= 0
    self.lives ||= 2
  end

  def add_points(item)
    inventory = Inventory.includes(:points).where(artist_id == self.id, item_id == item.id)
    puts inventory

    # if self.id == inventory.player_id && item.id == self.item_id
    #   player.points += item.points
    # end
  end

end
