require_relative './trivia.rb'
require_relative './question.rb'
require_relative './inventory.rb'
require_relative './item.rb'
require_relative './player.rb'
require 'pry'

class Game < Question

  ##Welcome
  def welcome
    puts "Welcome to Europe '72! To ride the bus with us, you'll have to answer a few questions and prove you are a true deadhead. If you pass our test, you can hop on...Otherwise you'll miss the tour!"
  end

  def prompt_user
    puts "Please enter a groovy username"
  end

  ##Enter username
  def enter_username
    # response = gets.chomp
    # this_player = Player.new(response)
    # this_player.save
    # puts "To begin, you have #{@this_player.lives} chances."
    # binding.pry
  end

  ##Story line
  def question_1
    puts "Don't worry, we'll start you off with an easy one. Answer this:"
  end

  ##Question
  def question_first_class
    Question.ask_question_first_class
  end

  def question_second_class
    Question.ask_question_second_class
  end

  def question_third_class
    Question.ask_question_third_class
  end

    def Question.correct
      # super
      puts "hi!"
    end

    def Question.incorrect
      # super
      puts "bye!"
    end

  def runner
    welcome
    prompt_user
    enter_username
  end

end

b = Game.new()
# b.runner
b.question_first_class
binding.pry
"hello"
