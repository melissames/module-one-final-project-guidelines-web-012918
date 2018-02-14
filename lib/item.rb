class Item

  attr_accessor :player, :name, :id_number, :user

  @@all = []

  def initialize(name, id_number, user=nil)
    @name = name
    @id_number = id_number
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

  def add_user(user)
    self.user = user
  end


end

  testing = Item.new("Test Case", 1)
  guitar_pick = Item.new("Keith Godchaux", 2)
  tie_dye = Item.new("Bob Weir", 3)
  china_cat = Item.new("Phil Lesh", 4)
  steal_your_face = Item.new("Mickey Hart", 5)
  scarlet = Item.new("Bill Kreutzmann", 6)
  bear = Item.new("Jerry Garcia", 7)
