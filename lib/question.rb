require_relative './trivia.rb'
require 'colorize'
require 'lolize/auto'
require 'pry'

class Question


  TRIVIA = Trivia.new()

  colorizer = Lolize::Colorizer.new

  def self.ask_question_first_class
    fake_array = [15, 17, 19, 21, 9, 6]
    song = TRIVIA.song_count
    question = "How many times was #{song.keys[0]} played during the Europe '72 tour?"
    if Game.asked_questions.include?(question)
      self.ask_question_first_class
    else
      puts question
      answer_array = [song.values[0], fake_array.sample]
      var = answer_array.sample
      other = answer_array.find {|el| el != var}
      puts "1. #{var}"
      puts "2. #{other}"

      response = STDIN.gets.chomp
      if response.to_s == song.values[0].to_s
        self.correct
      elsif response == "exit"
        self.exit
      else
        self.incorrect
      end
    end
    Game.add_to_asked_questions(question)
  end

  def self.ask_question_second_class
    fake_array = ["One More Saturday Night", "Mexicali Blues", "Casey Jones", "Big Railroad Blues", "Mr. Charlie", "He's Gone"]
    show = TRIVIA.first_song
    question = "What song did they open with at #{show.keys[0]} during the Europe '72 tour?"
    if Game.asked_questions.include?(question)
      self.ask_question_second_class
    else
      puts question
      answer_array = [show.values[0], fake_array.sample]
      var = answer_array.sample
      other = answer_array.find {|el| el != var}
      puts "1. #{var}"
      puts "2. #{other}"
      response = STDIN.gets.chomp
      if response == show.values[0]
        self.correct
      elsif response == "exit"
        self.exit
      else
        self.incorrect
      end
    end
    Game.add_to_asked_questions(question)
  end

  def self.ask_question_third_class
    fake_array = ["Bill Kreutzmann", "Donna Jean Godchaux", "Ron 'Pigpen' McKernan", "Neal Cassady"]
    band = TRIVIA.easy_questions_sample
    question =  "#{band.keys[0]}"
    if Game.asked_questions.include?(question)
      self.ask_question_third_class
    else
      puts question
      answer_array = [band.values[0], fake_array.sample]
      var = answer_array.sample
      other = answer_array.find {|el| el != var}
      puts "1. #{var}"
      puts "2. #{other}"
      response = STDIN.gets.chomp
      if response == band.values[0]
        self.correct
      elsif response == "exit"
        self.exit
      else
        self.incorrect
      end
    end
    Game.add_to_asked_questions(question)
  end

  def self.correct
    puts "You are correct!"
  end

  def self.incorrect
    puts "Sorry, you have lost a life"
  end

  def self.exit
    #break
  end


end
