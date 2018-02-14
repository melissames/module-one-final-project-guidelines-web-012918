require_relative './trivia.rb'
require 'pry'

class Question

  TRIVIA = Trivia.new()

  def self.ask_question_first_class
    fake_array = [15, 17, 19, 21, 9, 6]
    song = TRIVIA.song_count
    puts "How many times was #{song.keys[0]} played during the Europe '72 tour?"
    answer_array = [song.values[0], fake_array.sample]
    var = answer_array.sample
    other = answer_array.find {|el| el != var}
    puts "1. #{var}"
    puts "2. #{other}"
    response = gets.chomp
    puts song.values[0]

    if response.to_s == song.values[0].to_s
      return self.correct
    else
      return self.incorrect
    end
  end

  def self.ask_question_second_class
    fake_array = ["One More Saturday Night", "Mexicali Blues", "Casey Jones", "Big Railroad Blues", "Mr. Charlie", "He's Gone"]
    show = TRIVIA.first_song
    puts "What song did they open with at #{show.keys[0]} during the Europe '72 tour?"
    answer_array = [show.values[0], fake_array.sample]
    var = answer_array.sample
    other = answer_array.find {|el| el != var}
    puts "1. #{var}"
    puts "2. #{other}"

    response = gets.chomp
    response == show.values[0] ? self.correct : self.incorrect
  end

  def self.ask_question_third_class
    fake_array = ["Jerry Garcia", "Bob Weir", "Phil Lesh", "Mickey Hart", "The Ice Cream Kid"]

    band = TRIVIA.easy_questions_sample
    puts "#{band.keys[0]}"
    answer_array = [band.values[0], fake_array.sample]
    var = answer_array.sample
    other = answer_array.find {|el| el != var}
    puts "1. #{var}"
    puts "2. #{other}"

    response = gets.chomp
    response == band.values[0] ?  self.correct :  self.incorrect
  end

  def self.correct
    puts "You are correct!"
  end

  def self.incorrect
    puts "Sorry, you have lost a life"
  end


end

binding.pry

"hello"
