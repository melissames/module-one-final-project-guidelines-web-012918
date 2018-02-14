require_relative './trivia.rb'
require_relative './question.rb'
require_relative './item.rb'
require_relative './player.rb'
require 'colorized_string'
require 'colorize'
require 'pry'

class Game < Question

  def initialize(player=nil)
    @@asked_questions = []
    @@player = player || Player.new()
  end

  def stealyourface
puts "                ...............
              .,;;######################;;.,
            .;##''            ,/|        ``##;.
           .;#'             ,/##|__         `#;.
         .;#'              /######/'          `#;.
         ;#'                 ,/##/__            `#;
        ;#'                ,/######/'            `#;
        ;#'                /######/'              `#;
        ;#'                  ,/##/___              `#;
        ;#                 ,/#######/'              #;
         ;#                /#######/'               #;
          ;#                  ,/##/__               #;
          `#;               ,/######/'             ;#'
           `#;.            /######/'              ,;#'
             `#;.            ,/##/__             ,;#'
              `#;.          /######/'           ,;#'
                 ##;_          |##/'           _;##
                 :#`-;#;...    |/'       ...;#;-'#:
                   :`__ `-#### __  __ ####-' __':
                   :  ``------.. `' ..------''  :
                   `.. `--------`..'--------' ..'
                    :                        :
                    `:..      /:  :\      ..:'
                       `.     ::  ::     .'
                        #.              .#
                        `'##;##;##;##;##`'
                          `' `' `' `' `' "
  end

  ##Welcome
  def welcome
    puts "Oh no!\n The Grateful Dead have a big show tonight but manager Rock Scully can't find anyone in the band.\n It appears a crazed fan has kidnapped them and is holding the members hostage!\n Help Scully get the band back before the show tonight,\n by answering some of these questions!\n Remember, without Jerry, there is no Grateful Dead."
  end

  def prompt_user
    puts "To play, please enter a groovy username:"
  end

  ##Enter username
  def enter_username
    response = STDIN.gets.chomp
    @@player.username = response
    puts "You'll only have #{@@player.lives} chances to get it right."
  end

  ##Story line
  def question_1
    puts "Look's like the first one's an easy one, here you go:"
  end

  def question_array
    array = ["If you get this one, I'll see you on Shakedown Street", "C'mon and answer so we can go dancing in the street", "If you miss this, Bertha don't you come around here anymore", "I know you rider, you can get the next one", "Me and my uncle know the answer, do you?", "Here comes the sunshine. I mean... The next question!"]
    puts array.sample
  end

  ##Question
  def question_first_class
    Question.ask_question_first_class
  end

  def self.asked_questions
    @@asked_questions
  end

  def self.add_to_asked_questions(question)
    @@asked_questions << question
  end

  def question_second_class
    Question.ask_question_second_class
  end

  def question_third_class
    Question.ask_question_third_class
  end

  def random_question
    [question_first_class, question_second_class, question_third_class].sample
  end

    def Question.correct
      next_item = @@player.get_next_item
      next_item.add_user(@@player)

      puts "Congratulations! You now have saved #{@@player.return_item} and you have #{@@player.lives} chances left to rescue them all."
      # if @@player.return_item == "Bob Weir"
      #   puts "Fire on the mountain! But hurry up and answer the rest before the Dead misses their show!"
      # elsif @@player.return_item == "Mickey Hart"
      #   puts "What a miracle! Now, let's see if you can get the next one."
      if @@player.return_item == "Jerry Garcia"
        puts "RIGHT ON! We've got a show to put on!"
        pid = fork{ exec 'killall', "afplay" }
        abort("You won, thanks for rescuing the band!")
      end
    end

    def Question.incorrect
      @@player.remove_life
      puts "Uh oh, you lost a chance. You now only have #{@@player.lives} chance(s) left."
      # if @@player.lives == 2
      #   puts "Can a box of rain ease this pain?"
      # elsif @@player.lives == 1
      #   puts "Let me sing your blues away!"
      if @@player.lives == 0
        pid = fork{ exec 'killall', "afplay" }
        abort("The show wont' go on. Play again, and better luck next time!")
      end
    end

    def Question.exit
      pid = fork{ exec 'killall', "afplay" }
      abort("Sorry to see you go!")
    end

  def runner
    pid = fork{ exec 'afplay', "media/(Disc 7) 05 - Scarlet Begonias.mp3" }
    stealyourface
    welcome
    prompt_user
    enter_username
    question_1
    until @@player.lives == 0 || @@player.return_item == "Jerry Garcia" do
      random_question
      question_array
    end

  end

end

b = Game.new
b.runner
