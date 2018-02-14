require_relative './trivia.rb'
require_relative './question.rb'
require_relative './item.rb'
require_relative './player.rb'
require 'pry'

class Game < Question

  def initialize(player=nil)
    @@player = player || Player.new()
  end

  ##Welcome
  def welcome
    puts "Welcome to Europe '72! To ride the bus with us, you'll have to answer a few questions and prove you are a true deadhead. If you pass our test, you can hop on...Otherwise you'll miss the tour!"
  end

  def prompt_user
    puts "Please enter a groovy username"
  end

  ##Enter username
  def enter_username
    response = gets.chomp
    @@player.username = response
    puts "To begin, you have #{@@player.lives} chances."
    # binding.pry
  end

  ##Story line
  def question_1
    puts "Don't worry, we'll start you off with an easy one. Answer this:"
  end

  def question_2
    puts "Here comes the next question"
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
      # binding.pry
      puts "Congratulations! You now have #{@@player.next_item} and you have a #{@@player.lives} lives left."
    end

    def Question.incorrect
      # binding.pry
      @@player.remove_life
      puts "Sorry, you lost a life. You now have #{@@player.lives} lives."
    end

  def runner
    welcome
    prompt_user
    enter_username
    question_1
    question_first_class
    question_2
    question_second_class
  end

end

b = Game.new
b.runner
