require_relative './trivia.rb'
require_relative './question.rb'
require_relative './inventory.rb'
require_relative './item.rb'
require_relative './player.rb'
require 'pry'

class Game

  ##Welcome
  def welcome
    puts "Welcome to Europe '72! To ride the bus with us, you'll have to answer a few questions. But don't get too excited, you'll only have a couple of chances...Otherwise you'll miss the shows!"
  end

  def prompt_user
    puts "Please enter a groovy username"
  end

  ##Enter username
  def enter_username
    response = gets.chomp
    @this_player = Player.new(response)
    puts "To begin, you have #{@this_player.lives} lives and #{@this_player.points} points."
    binding.pry
  end

  ##Story line

  ##Question
  def question_first_class
    Question.ask_question_first_class
  end

    ##Correct

    ##Incorrect

end

b = Game.new()
binding.pry
"hello"
