# #The Artist class will be responsible for either creating the artist (if the artist doesn't exist in our program yet)
# # or finding the instance of that artist (if the artist does exist).

# class Artist

# 	attr_accessor :name, :songs


# @@all = []

# 	def initialize(name)
# 		@name = name
# 		@songs = []
# 	end

# 	def name
# 		@name
# 	end

# 	def add_song(song)
# 		@songs << song
# 	end

# 	def self.save
# 		@@all << self
# 		@@all
# 	end

# 	def save
# 		@@all << self
# 	end

# 	def self.all
# 		@@all
# 	end

# 	def self.find_or_create_by_name(name)

# 		if @@all.find {|artist| artist.name == name}
# 			self
# 		else
# 			new_artist = self.new(name)
# 			@@all << new_artist
# 		end
# 		new_artist
# 	end

# 	def print_songs
# 		self.songs.each { |song| puts song.name }
# 	end


# end

class Artist
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all    
  end

  def add_song(song)
    @songs << song
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end


  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each {|song| puts song.name}
  end
end