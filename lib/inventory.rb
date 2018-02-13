class Inventory < ActiveRecord::Base

  belongs_to :item
  belongs_to :player
  after_initialize :defaults

  def defaults
    self.player_id ||= 0
    self.item_id ||= 0
  end

  def add_item_to_player(player, item)
    self.player_id = player.id
    retrieved_item = Item.find_by name: item.name
    self.item_id = retrieved_item.id
    self.save
  end
  #item attributes are not accessable





end
