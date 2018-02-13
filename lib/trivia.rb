require 'gdshowsdb'
require 'pry'

class Trivia

Gdshowsdb.init()
Gdshowsdb.load()

  def europe_72_hash
    hash = {}
    shows_1972 = Show.all.where(year: 1972).where(("country != ?"), "US")
    shows_1972.each do |show|
      show_set = ShowSet.all.find {|showset| showset.show_uuid == show.uuid}
      song_match = Song.where(show_set_uuid: show_set.uuid)
      song_match.each do |song|
        song_ref_match = SongRef.find_by(uuid: song.song_ref_uuid).name
        if hash[show] == nil
          hash[show] = []
          hash[show] << song_ref_match
        else
          hash[show] << "#{song_ref_match}"
        end
      end
    end
    hash
  end

  def shows
    hash = europe_72_hash
    date_hash = {}
    hash.map do |key, value|
      if date_hash["#{key.venue}, #{key.city} on #{key.month}/#{key.day}"] == nil
        date_hash["#{key.venue}, #{key.city} on #{key.month}/#{key.day}"] = value
      else
        date_hash["#{key.venue}, #{key.city} on #{key.month}/#{key.day}"] << value
      end
    end
    date_hash
  end

  def select_random_show
    show_array = ["Wembley Empire Pool, London on 4/7", "Tivoli Concert Hall, Copenhagen on 4/17", "The Strand Lyceum, London on 5/26", "Olympia Theater, Paris on 5/3", "Bickershaw Festival, Wigan on 5/7", "Rotterdam Civic Hall, Rotterdam on 5/11"]
    show_array.sample
  end

  def first_song
    show = select_random_show
    shows_hash = shows
    show_match = shows_hash.select {|key, value| key == show}
    hash = {show => show_match.values[0][0]}
  end

  def select_random_song
    song_array = ["Jack Straw", "Bertha", "Sugar Magnolia", "I Know You Rider", "Sugaree", "Not Fade Away"]
    song_array.sample
  end

  def song_count
    song = select_random_song
    song_shows = SongRef.find_by_name(song).shows
    match = song_shows.select {|show| show.title[0..3] == "1972" && show.country != "US"}.length
    hash = {song => match}
  end

  def easy_questions
    {
      1 => {
        :"Who got lost in a museum in Amsterdam hours before a show, and had to be found by the police?" => "Bob Weir"},

      2 => {:"Who met their doppelganger in Germany?" => "Phil Lesh"},

      3 => {:"Who is missing half of their right middle finger?" => "Jerry Garcia"},

      4 => {:"Who dosed the security guards at a show in Belgium?" => "Mickey Hart"},

      5 => {:"Who is displayed on the Europe '72 album cover?" => "Ice Cream Kid"},

      6 =>{:"To which song do these lyrics belong: 'Like a crazy quilt star gown through a dream night wind'?" => "China Cat Sunflower"}
    }
  end


  def easy_questions_sample
    easy_questions[rand(1..6)]
  end

end
