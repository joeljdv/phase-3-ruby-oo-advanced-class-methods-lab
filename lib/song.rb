require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song  
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      else
        create_by_name(name)
      end
  end

  def self.alphabetical
    self.all.sort_by{|a| a.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    filename_split = filename.split(" - ")
    song_name_split = filename_split[1].split(".")
    song_name = song_name_split[0]
    artist_name = filename_split[0]
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.all << new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end