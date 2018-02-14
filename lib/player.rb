class Player

  attr_accessor :name, :lives, :username, :item

  def initialize(username=nil)
    @username = username
    @lives = 3
    @item = 0
  end

  def get_next_item
    last_item = player_items.last != nil ? player_items.last.id_number : 0
    next_id = last_item + 1
    next_item = Item.all.find {|item| item.id_number == next_id}
  end

  def return_item
    get_next_item.name
  end

  def remove_life
    @lives = @lives - 1
  end

  def player_items
    Item.all.select {|item| item.user == self}
  end


end
