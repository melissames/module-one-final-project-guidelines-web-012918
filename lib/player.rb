class Player

  attr_accessor :name, :lives, :username, :item

  def initialize(username=nil)
    @username = username
    @lives = 3
    @item = 0
  end

  def next_item
    @item += 1
    found_item = Item.all.find {|item| self.item == item.id_number}
    #iterates through all items and selects the items with the id number that matches the players item number
    # .map{|item| item.username = self.username}
    #sets the items username to connect them
    found_item.name
    #returns the next item
  end

  def remove_life
    @lives = @lives - 1
  end

  def return_players_items
    Item.all.select {|item| item.username == self.username}
    #returns all items that a user has collected throughout the game
  end



end
