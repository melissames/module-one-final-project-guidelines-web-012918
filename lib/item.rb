class Item

  attr_accessor :player, :name, :id_number

  @@all = []

  def initialize(name, id_number)
    @name = name
    @id_number = id_number
    @@all << self
  end

  def self.all
    @@all
  end

  # def add_username(username)
  #   self.username = username
  # end



  #if the username matches the player.username return the items

  def return_users_items(player)
    self.all.select{|item| player.username == item.username}
  end



end

  guitar_pick = Item.new("Guitar Pick", 1)
  tie_dye = Item.new("Tie Dye Shirt", 2)
  china_cat = Item.new("China Cat Sunflower", 3)
  steal_your_face = Item.new("Steal Your Face", 4)
  scarlet = Item.new("Scarlet Begonia", 5)
  bear = Item.new("Dancing Bear", 6)
