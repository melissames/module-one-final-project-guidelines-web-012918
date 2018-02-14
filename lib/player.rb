class Player

  attr_accessor :name, :lives, :username, :item

  def initialize(username)
    @username = username
    @lives = 3
    @item = 1
  end

  def next_item
    @item += 1
    found_item = Item.all.select {|item| self.item == item.id_number}
    found_item
  end



end
